from django.test import TestCase
import inspect
from .registry import MLRegistry
from .classifier.ada import Ada
from .classifier.log import Models

class MLTests(TestCase):
    def test_rf_algorithm(self):
        input_data = {
            "age": 63,
            "sex": 1,
            "cp": 3,
            "trestbps":145,
            "chol": 233,
            "fbs": 1,
            "restecg": 0,
            "thalach": 150,
            "exang": 0,
            "oldpeak": 2.3,
            "slope": 0,
            "ca": 0,
            "thal": 1,
        }
        my_alg = Models()
        response = my_alg.compute_prediction(input_data)
        self.assertEqual('OK', response['status'])
        self.assertTrue('label' in response)
        self.assertEqual('Disease', response['label'])

    def test_registry(self):
        registry = MLRegistry()
        self.assertEqual(len(registry.endpoints), 0)
        endpoint_name = "income_classifier"
        algorithm_object = Models()
        algorithm_name = "Models"
        algorithm_status = "production"
        algorithm_version = "0.0.1"
        algorithm_owner = "Piotr"
        algorithm_description = "Random Forest with simple pre- and post-processing"
        algorithm_code = inspect.getsource(Models)
        # add to registry
        registry.add_algorithm(endpoint_name, algorithm_object, algorithm_name,
                               algorithm_status, algorithm_version, algorithm_owner,
                               algorithm_description, algorithm_code)
        # there should be one endpoint available
        self.assertEqual(len(registry.endpoints), 1)

    def test_et_algorithm(self):
        input_data = {
            "age": 63,
            "sex": 1,
            "cp": 3,
            "trestbps": 145,
            "chol": 233,
            "fbs": 1,
            "restecg": 0,
            "thalach": 150,
            "exang": 0,
            "oldpeak": 2.3,
            "slope": 0,
            "ca": 0,
            "thal": 1,
        }
        my_alg = Ada()
        response = my_alg.compute_prediction(input_data)
        self.assertEqual('OK', response['status'])
        self.assertTrue('label' in response)
        self.assertEqual('Disease', response['label'])



a=MLTests()
a.test_et_algorithm()
