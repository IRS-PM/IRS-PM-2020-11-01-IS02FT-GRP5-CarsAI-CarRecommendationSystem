#%%
import sys, os
import pandas as pd
import numpy as np
from sklearn import svm
from sklearn.model_selection import train_test_split, GridSearchCV

# Read data
inputPath = 'db/da.csv'
df = pd.read_csv(inputPath,encoding='utf8')
x = df.drop(['carsid'],axis=1)
labels = df.carsid

# Split data to train and test on 80-20 ratio
X_train, X_test, y_train, y_test = train_test_split(x, labels, test_size = 0.2, random_state=2)

# # Grid Search
# # Parameter Grid
# param_grid = {'C': [0.1, 1, 10, 100], 'gamma': [1, 0.1, 0.01, 0.001, 0.00001, 10]}
# # Make grid search classifier
# clf_grid = GridSearchCV(svm.SVC(), param_grid, verbose=1)
# # Train the classifier
# clf_grid.fit(X_train, y_train)
# # clf = grid.best_estimator_()
# print("Best Parameters:\n", clf_grid.best_params_)
# print("Best Estimators:\n", clf_grid.best_estimator_)

# print(sys.argv[1])
testing = np.array([sys.argv[1:]])
testing.resize(1,6)

clf = svm.SVC(kernel='rbf', C = 100, gamma=0.01)
clf.fit(X_train, y_train)

clf_predictions = clf.predict(testing)
print(clf_predictions[0])