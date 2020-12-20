import joblib
import pandas as pd
from sklearn.preprocessing import LabelEncoder, StandardScaler, MinMaxScaler
import os
from django.conf import settings
import json

class Models:
    def __init__(self):
        path_to_log = os.path.join(settings.BASE_DIR,r"research/model/logreg.pkl")
        self.encoders = LabelEncoder()
        self.log = joblib.load(path_to_log)

    def preprocessing(self, input_data):
        # JSON to pandas DataFrame
        input_data = pd.DataFrame(input_data, index=[0])
        input_data['age2'] = input_data['age'] // 10
        input_data['trestbps2'] = input_data['trestbps'] // 10
        input_data['chol2'] = input_data['chol'] // 40
        input_data['thalach2'] = input_data['thalach'] // 40
        input_data['oldpeak2'] = input_data['oldpeak'] // 0.4
        for i in ['sex', 'age2', 'fbs', 'restecg', 'exang', 'thal', ]:
            for j in ['cp', 'trestbps2', 'chol2', 'thalach2', 'oldpeak2', 'slope', 'ca']:
                input_data[i + "_" + j] = input_data[i].astype('str') + "_" + input_data[j].astype('str')
        # convert categoricals
        categorical_columns = []
        numerics = ['int8', 'int16', 'int32', 'int64', 'float16', 'float32', 'float64']
        features = input_data.columns.values.tolist()
        for col in features:
            if input_data[col].dtype in numerics: continue
            categorical_columns.append(col)

        for col in categorical_columns:
            if col in input_data.columns:
                le = LabelEncoder()
                le.fit(list(input_data[col].astype(str).values))
                input_data[col] = le.transform(list(input_data[col].astype(str).values))

        scaler2 = StandardScaler()
        train0 = pd.DataFrame(scaler2.fit_transform(input_data), columns=input_data.columns)
        return train0

    def predict(self, input_data):
        return self.log.predict_proba(input_data)

    def postprocessing(self, input_data):
        label = "Disease"
        if input_data[1] < 0.5:
            label = "No Disease"
        return {"probability":input_data[1], "label": label, "status": "OK"}

    def compute_prediction(self, input_data):
        try:
            input_data = self.preprocessing(input_data)
            prediction = self.predict(input_data)[0]  # only one sample
            prediction = self.postprocessing(prediction)
        except Exception as e:
            return {"status": "Error", "message": str(e)}

        return prediction


