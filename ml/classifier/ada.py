import joblib
import pandas as pd
from sklearn.preprocessing import LabelEncoder, StandardScaler, MinMaxScaler
import os
from django.conf import settings
import numpy as np


class Ada:
    def __init__(self):
        path_to_ada = os.path.join(settings.BASE_DIR, r"research/boost.pkl")
        self.encoders = LabelEncoder()
        self.ada = joblib.load(path_to_ada)

    def preprocessing(self, input_data):
        # JSON to pandas DataFrame
        input_data = pd.DataFrame(input_data, index=[0])
        categorical_columns = []
        numerics = ['int8', 'int16', 'int32', 'int64', 'float16', 'float32', 'float64']
        features = input_data.columns.values.tolist()
        for col in features:
            if input_data[col].dtype in numerics: continue
            categorical_columns.append(col)
        for col in categorical_columns:
            if col in input_data.columns:
                le = LabelEncoder()
                # le.fit(list(input_data[col].astype(str).values))
                psth = "research/label/" + col + '.npy'
                le.classes_ = np.load(psth, allow_pickle=True)
                input_data[col] = le.transform(list(input_data[col].astype(str).values))
        le = LabelEncoder()
        le.classes_ = np.load("research/label/Age.npy", allow_pickle=True)
        input_data['age'] = le.transform(list(input_data['age'].values))
        feature_cols = ['age', 'gender', 'family_history', 'benefits', 'care_options', 'anonymity', 'leave',
                        'work_interfere']
        # scaler2 = joblib.load("research/label/std_scaler.bin")
        # train0 = pd.DataFrame(scaler2.transform(input_data), columns=input_data.columns)
        return input_data[feature_cols]

    def predict(self, input_data):
        return self.ada.predict_proba(input_data)

    def postprocessing(self, input_data):
        label = "Treatment"
        if input_data[1] < 0.5:
            label = "No Treatment"
        return {"probability": input_data[1], "label": label, "status": "OK"}

    def compute_prediction(self, input_data):
        # try:
        input_data = self.preprocessing(input_data)
        prediction = self.predict(input_data)[0]  # only one sample
        prediction = self.postprocessing(prediction)
        # except Exception as e:
        #     return {"status": "Error", "message": str(e)}

        return prediction
