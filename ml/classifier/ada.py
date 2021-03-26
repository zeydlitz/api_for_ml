import joblib
import pandas as pd
from sklearn.preprocessing import LabelEncoder, StandardScaler, MinMaxScaler
import os
from django.conf import settings
import numpy as np


class Ada:
    def __init__(self):
        path_to_ada = os.path.join(settings.BASE_DIR, r"research/model/1g.pkl")
        self.encoders = LabelEncoder()
        self.ada = joblib.load(path_to_ada)

    def preprocessing(self, input_data):
        # JSON to pandas DataFrame
        input_data = pd.DataFrame(input_data, index=[0])
        input_data['age2'] = input_data['age'] // 10
        input_data['trestbps2'] = input_data['trestbps'] // 10
        input_data['chol2'] = input_data['chol'] // 40
        input_data['thalach2'] = input_data['thalach'] // 40
        input_data['oldpeak2'] = input_data['oldpeak'] // 0.4
        input_data['sex'] = np.where(input_data['sex'] == 'Male', 1, 0)
        input_data['oldpeak2'] = np.where(input_data['oldpeak2'] == 12.0, 13.0, input_data['oldpeak2'])
        # if input_data['oldpeak2'].values==12.0:
        #     input_data['oldpeak2']=13.0
        # if input_data['sex'].values=='Male':
        #     input_data['sex']=1
        # else:
        #     input_data['sex'] = 0
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
        path1 = '../../research/label/sex_ca.npy'
        for col in categorical_columns:
            if col in input_data.columns:
                le = LabelEncoder()
                # le.fit(list(input_data[col].astype(str).values))
                psth = "research/label/" + col + '.npy'
                le.classes_ = np.load(psth)
                try:
                    input_data[col] = le.transform(list(input_data[col].astype(str).values))
                except:
                    input_data[col] = le.transform([le.classes_[0]])

        scaler2 = joblib.load("research/label/std_scaler.bin")
        train0 = pd.DataFrame(scaler2.transform(input_data), columns=input_data.columns)
        return train0

    def predict(self, input_data):
        return self.ada.predict_proba(input_data)

    def postprocessing(self, input_data):
        label = "Disease"
        if input_data[1] < 0.5:
            label = "No Disease"
        return {"probability": input_data[1], "label": label, "status": "OK"}

    def compute_prediction(self, input_data):
        try:
            input_data = self.preprocessing(input_data)
            prediction = self.predict(input_data)[0]  # only one sample
            prediction = self.postprocessing(prediction)
        except Exception as e:
            return {"status": "Error", "message": str(e)}

        return prediction
