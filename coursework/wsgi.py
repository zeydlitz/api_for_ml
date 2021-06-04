"""
WSGI config for coursework project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'coursework.settings')

application = get_wsgi_application()
import inspect
from ml.registry import MLRegistry
from ml.classifier.log import Models
from ml.classifier.ada import Ada



try:
    registry = MLRegistry() # create ML registry
    # Random Forest classifier
    # rf = Models()
    # # add to ML registry
    # registry.add_algorithm(endpoint_name="classifier",
    #                         algorithm_object=rf,
    #                         algorithm_name="Models",
    #                         algorithm_status="production",
    #                         algorithm_version="0.0.1",
    #                         owner="Piotr",
    #                         algorithm_description="Models with simple pre- and post-processing",
    #                         algorithm_code=inspect.getsource(Models))

    # Extra Trees classifier
    et =Ada()
    # add to ML registry
    registry.add_algorithm(endpoint_name="classifier",
                            algorithm_object=et,
                            algorithm_name="Ada",
                            algorithm_status="testing",
                            algorithm_version="0.0.1",
                            owner="Piotr",
                            algorithm_description="Extra Trees with simple pre- and post-processing",
                            algorithm_code=inspect.getsource(Ada))
except Exception as e:
    print("Exception while loading the algorithms to the registry,", str(e))