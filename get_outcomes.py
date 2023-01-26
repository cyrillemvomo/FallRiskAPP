from flask import Flask, jsonify, request
import json
# Import all the tools we need

# Regular EDA (exploratory data analysis) and plotting libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from numpy import mean
from numpy import std
# we want our plots to appear inside the notebook
# %matplotlib inline
import json
import pickle
# Models from Scikit-Learn
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import validation_curve
# Model Evaluations
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.model_selection import RandomizedSearchCV, GridSearchCV
from sklearn.metrics import confusion_matrix, classification_report
from sklearn.metrics import precision_score, recall_score, f1_score
from sklearn.metrics import plot_roc_curve
from sklearn.model_selection import RepeatedKFold
from sklearn.model_selection import cross_val_score
from sklearn.linear_model import LogisticRegression
import warnings
from sklearn.model_selection import learning_curve #LearningCurveDisplay, ShuffleSplit
import pandas as pd
from sklearn.feature_selection import RFE
import numpy as np
from imblearn.over_sampling import SMOTE
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots
import scipy
from sklearn.preprocessing import MinMaxScaler
# %matplotlib inline
import matplotlib.pyplot as plt
from scipy.signal import detrend
import sys
import seaborn as sns
import sklearn
from mlxtend.plotting import plot_learning_curves
from sklearn import preprocessing
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn import metrics
from sklearn.metrics import confusion_matrix
from sklearn.metrics import precision_score, recall_score, f1_score, accuracy_score
from sklearn.datasets import make_classification
from matplotlib import pyplot
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import mean_squared_error
from sklearn.inspection import permutation_importance
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
from sklearn.metrics import confusion_matrix, classification_report
from sklearn.preprocessing import StandardScaler
from torch import nn
from torch.nn import functional as F
from sklearn.metrics import roc_curve
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import make_classification
import random
import scipy.stats as stats
import statsmodels.api as sm
from mlxtend.plotting import plot_learning_curves
from sklearn.model_selection import learning_curve
from scipy.cluster.hierarchy import linkage, dendrogram, fcluster
from scipy.spatial.distance import squareform
from sklearn.metrics import roc_auc_score
import signal_processing_app
from signal_processing_app import signal_processing

#declared an empty variable for reassignment
response = ''

#creating the instance of our flask application
app = Flask(__name__)

#route to entertain our post and get request from flutter app
@app.route('/name', methods = ['GET', 'POST'])
def nameRoute():




    #fetching the global variable to manipulate inside the function
    global response
    with open('/Users/cyrilleetude/Desktop/Bureau - MacBook Air de Cyrille/Semester_Project_Cyrille_2022/MachineLEARNING/Models/Saved_Models/LogisticRegression_Model.pkl', 'rb') as file:  
        Loaded_Model = pickle.load(file)
    #checking the request type we get from the app
    if(request.method == 'POST'):
        request_data = request.data #getting the response data
        request_data = json.loads(request_data.decode('utf-8')) #converting it from json to key value pair
        data = request_data['name'] #a list of 46
        # testdata = [[list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100)],
        #             [list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100)],
        #             [list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100)],
        #             [list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100),list(np.linspace(0, 100, 1000)/100)]
        #             ]
        response = f'{signal_processing(data)}'[1:-1] #re-assigning response with the name we got from the user
        # response = response[1:]
        return " " #to avoid a type error 
    else:
        # return jsonify({'name' : response}) #sending data back to your frontend app
        return jsonify({'name' : response})

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8081)


    # app.run(host='0.0.0.0', port=8080, debug = True) #debug will allow changes without shutting down the server 