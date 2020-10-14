from django.urls import path
from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter
from .views import ApprovalsView

from .views import EndpointViewSet
from .views import MLAlgorithmViewSet
from .views import MLAlgorithmStatusViewSet
from .views import MLRequestViewSet
from .views import PredictView
from .views import ABTestViewSet
from .views import StopABTestView
from .views import HomePageView , Forms , myform
router = DefaultRouter(trailing_slash=False)
router.register(r"endpoints", EndpointViewSet, basename="endpoints")
router.register(r"mlalgorithms", MLAlgorithmViewSet, basename="mlalgorithms")
router.register(r"mlalgorithmstatuses", MLAlgorithmStatusViewSet, basename="mlalgorithmstatuses")
router.register(r"mlrequests", MLRequestViewSet, basename="mlrequests")
router.register(r"abtests", ABTestViewSet, basename="abtests")
router.register('MyAPI', ApprovalsView)
urlpatterns = [
    #path('api/', include(router.urls)),
    path('', HomePageView.as_view(), name='home'),
    url(r"^api/", include(router.urls)),
    url(
        r"^(?P<endpoint_name>.+)/predict$", PredictView.as_view(), name="predict"
    ),
url(
        r"^api/v1/stop_ab_test/(?P<ab_test_id>.+)", StopABTestView.as_view(), name="stop_ab"
    ),
#    path('form/', Forms.as_view(), name='forms'),
   path('form/', myform, name='forms'),
    path('form/<int:pk>/', Forms.as_view(), name='forms'),

]


