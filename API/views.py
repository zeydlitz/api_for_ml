from django.shortcuts import render, get_object_or_404
from django.urls import reverse

from .froms import MyForm
from rest_framework import viewsets, mixins
from rest_framework.decorators import api_view
from django.core import serializers
from rest_framework.response import Response
from rest_framework import status
from django.http import JsonResponse
from rest_framework.parsers import JSONParser
from .models import heartd
from .serializers import approvalsSerializers
import pickle
import joblib
import json
import numpy as np
from sklearn import preprocessing
import pandas as pd

from django.db.models import F
import datetime
from django.db import transaction
from .models import ABTest
from .serializers import ABTestSerializer
# backend/server/apps/endpoints/views.py file
import json
from numpy.random import rand
from rest_framework import views, status
from rest_framework.response import Response
from ml.registry import MLRegistry
from coursework.wsgi import registry
from loguru import logger

logger.add("debug.log", format="{time} {level} {message}", level='DEBUG', rotation='10 KB', compression='zip')

from rest_framework import viewsets
from rest_framework import mixins
from rest_framework.exceptions import APIException

from .models import Endpoint
from .serializers import EndpointSerializer

from .models import MLAlgorithm, heartd
from .serializers import MLAlgorithmSerializer

from .models import MLAlgorithmStatus
from .serializers import MLAlgorithmStatusSerializer
from ml.classifier.ada import Ada
from ml.classifier.log import Models
from .models import MLRequest
from .serializers import MLRequestSerializer
from django.db import transaction
from django.views.generic import TemplateView, CreateView
from .froms import EmailPostForm
from django.core.mail import send_mail


def post_share(request):
    sent = False
    if request.method == 'POST':
        # Form was submitted
        form = EmailPostForm(request.POST)
        if form.is_valid():
            # Form fields passed validation
            cd = form.cleaned_data
            subject = f"Hello, {cd['name']}, we have recived your message."
            message = f"Your message:\n" \
                      f"{cd['name']} , {cd['comments']}"
            send_mail(subject, message, 'maksimka.ivashkevich27@gmail.com', [cd['email']])
            sent = True
            form.save()
    # ... send email
    else:
        form = EmailPostForm()
    return render(request, 'list/email.html', {'form': form, 'sent': sent})


class ApprovalsView(viewsets.ModelViewSet):
    queryset = heartd.objects.all()
    serializer_class = approvalsSerializers


class Forms(CreateView):
    def get_success_url(self):
        return reverse('offerta_create', args=(self.object.id,))

    model = heartd
    template_name = 'list/forms.html'
    fields = '__all__'


class About(TemplateView):
    template_name = 'list/generic.html'


class HomePageView(TemplateView):
    template_name = 'home.html'


def myform(request):
    sent = False
    response = None
    if request.method == "POST":
        form = MyForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            # my_alg = Ada()
            my_alg = Models()
            response = my_alg.compute_prediction(cd)
            response['probability'] = float("{:.2f}".format(response['probability']))
            sent = True
            form.save()
    else:
        form = MyForm()
    return render(request, "list/forms.html", {'sent': sent, 'response': response, 'form': form})


class EndpointViewSet(
    mixins.RetrieveModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet
):
    serializer_class = EndpointSerializer
    queryset = Endpoint.objects.all()


class MLAlgorithmViewSet(
    mixins.RetrieveModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet
):
    serializer_class = MLAlgorithmSerializer
    queryset = MLAlgorithm.objects.all()


def deactivate_other_statuses(instance):
    old_statuses = MLAlgorithmStatus.objects.filter(parent_mlalgorithm=instance.parent_mlalgorithm,
                                                    created_at__lt=instance.created_at,
                                                    active=True)
    for i in range(len(old_statuses)):
        old_statuses[i].active = False
    MLAlgorithmStatus.objects.bulk_update(old_statuses, ["active"])


class MLAlgorithmStatusViewSet(
    mixins.RetrieveModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet,
    mixins.CreateModelMixin
):
    serializer_class = MLAlgorithmStatusSerializer
    queryset = MLAlgorithmStatus.objects.all()

    def perform_create(self, serializer):
        try:
            with transaction.atomic():
                instance = serializer.save(active=True)
                # set active=False for other statuses
                deactivate_other_statuses(instance)



        except Exception as e:
            raise APIException(str(e))


class MLRequestViewSet(
    mixins.RetrieveModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet,
    mixins.UpdateModelMixin
):
    serializer_class = MLRequestSerializer
    queryset = MLRequest.objects.all()


class PredictView(views.APIView):
    def post(self, request, endpoint_name, format=None):
        logger.info("In Predict View")

        algorithm_status = self.request.query_params.get("status", "production")
        algorithm_version = self.request.query_params.get("version")
        # algs = MLAlgorithm.objects.filter(parent_endpoint__name=endpoint_name, status__status=algorithm_status,
        #                                status__active=True)
        algs = [MLAlgorithm.objects.get(id=1)]
        if algs == []:
            logger.error("algs is empty")

        if algorithm_version is not None:
            logger.info("algorithm_version is not None")
            algs = algs.filter(version=algorithm_version)

        if len(algs) == 0:
            logger.error("HTTP_400_BAD_REQUEST")
            return Response(
                {"status": "Error", "message": "ML algorithm is not available"},
                status=status.HTTP_400_BAD_REQUEST,
            )
        if len(algs) != 1 and algorithm_status != "ab_testing":
            return Response(
                {"status": "Error",
                 "message": "ML algorithm selection is ambiguous. Please specify algorithm version."},
                status=status.HTTP_400_BAD_REQUEST,
            )
        alg_index = 0
        if algorithm_status == "ab_testing":
            logger.info('AB')
            alg_index = 0 if rand() < 0.5 else 1

        algorithm_object = registry.endpoints[algs[alg_index].id]
        prediction = algorithm_object.compute_prediction(request.data)

        label = prediction["label"] if "label" in prediction else "error"
        ml_request = MLRequest(
            input_data=json.dumps(request.data),
            full_response=prediction,
            response=label,
            feedback="",
            parent_mlalgorithm=algs[alg_index],
        )
        ml_request.save()

        prediction["request_id"] = ml_request.id
        logger.info("In the end of PredictView")

        return Response(prediction)


class ABTestViewSet(
    mixins.RetrieveModelMixin, mixins.ListModelMixin, viewsets.GenericViewSet,
    mixins.CreateModelMixin, mixins.UpdateModelMixin
):
    serializer_class = ABTestSerializer
    queryset = ABTest.objects.all()

    def perform_create(self, serializer):
        try:
            with transaction.atomic():
                instance = serializer.save()
                # update status for first algorithm

                status_1 = MLAlgorithmStatus(status="ab_testing",
                                             created_by=instance.created_by,
                                             parent_mlalgorithm=instance.parent_mlalgorithm_1,
                                             active=True)
                status_1.save()
                deactivate_other_statuses(status_1)
                # update status for second algorithm
                status_2 = MLAlgorithmStatus(status="ab_testing",
                                             created_by=instance.created_by,
                                             parent_mlalgorithm=instance.parent_mlalgorithm_2,
                                             active=True)
                status_2.save()
                deactivate_other_statuses(status_2)

        except Exception as e:
            raise APIException(str(e))


class StopABTestView(views.APIView):
    def post(self, request, ab_test_id, format=None):

        try:
            ab_test = ABTest.objects.get(pk=ab_test_id)

            if ab_test.ended_at is not None:
                return Response({"message": "AB Test already finished."})

            date_now = datetime.datetime.now()
            # alg #1 accuracy
            all_responses_1 = MLRequest.objects.filter(parent_mlalgorithm=ab_test.parent_mlalgorithm_1,
                                                       created_at__gt=ab_test.created_at,
                                                       created_at__lt=date_now).count()
            correct_responses_1 = MLRequest.objects.filter(parent_mlalgorithm=ab_test.parent_mlalgorithm_1,
                                                           created_at__gt=ab_test.created_at, created_at__lt=date_now,
                                                           response=F('feedback')).count()
            accuracy_1 = correct_responses_1 / float(all_responses_1)
            print(all_responses_1, correct_responses_1, accuracy_1)

            # alg #2 accuracy
            all_responses_2 = MLRequest.objects.filter(parent_mlalgorithm=ab_test.parent_mlalgorithm_2,
                                                       created_at__gt=ab_test.created_at,
                                                       created_at__lt=date_now).count()
            correct_responses_2 = MLRequest.objects.filter(parent_mlalgorithm=ab_test.parent_mlalgorithm_2,
                                                           created_at__gt=ab_test.created_at, created_at__lt=date_now,
                                                           response=F('feedback')).count()
            accuracy_2 = correct_responses_2 / float(all_responses_2)
            print(all_responses_2, correct_responses_2, accuracy_2)
            # select algorithm with higher accuracy
            alg_id_1, alg_id_2 = ab_test.parent_mlalgorithm_1, ab_test.parent_mlalgorithm_2
            # swap
            if accuracy_1 < accuracy_2:
                alg_id_1, alg_id_2 = alg_id_2, alg_id_1

            status_1 = MLAlgorithmStatus(status="production",
                                         created_by=ab_test.created_by,
                                         parent_mlalgorithm=alg_id_1,
                                         active=True)
            status_1.save()
            deactivate_other_statuses(status_1)
            # update status for second algorithm
            status_2 = MLAlgorithmStatus(status="testing",
                                         created_by=ab_test.created_by,
                                         parent_mlalgorithm=alg_id_2,
                                         active=True)
            status_2.save()
            deactivate_other_statuses(status_2)

            summary = "Algorithm #1 accuracy: {}, Algorithm #2 accuracy: {}".format(accuracy_1, accuracy_2)
            ab_test.ended_at = date_now
            ab_test.summary = summary
            ab_test.save()

        except Exception as e:
            return Response({"status": "Error", "message": str(e)},
                            status=status.HTTP_400_BAD_REQUEST
                            )
        return Response({"message": "AB Test finished.", "summary": summary})
