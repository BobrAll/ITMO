import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import r2_score


def show_statistics(dataset):
    # histogram settings
    cols_val = 30
    edgecolor = 'black'

    data_statistic = dataset.describe()
    print(data_statistic)

    # Create graphics with statistics
    fig, axes = plt.subplots(nrows=2, ncols=3, figsize=(14, 7))
    fig.subplots_adjust(hspace=0.5)

    for i, col in enumerate(dataset.columns):
        ax = axes[i // 3, i % 3]

        dataset[col].plot(kind='hist',
                          ax=ax,
                          bins=cols_val,
                          edgecolor=edgecolor)

        ax.set_title(col)
        ax.set_xlabel('value')
        ax.set_ylabel('count')

    plt.show()


def prepare_dataset(dataset):
    # convert Yes/No to 1/0
    dataset['Extracurricular Activities'] = (
        dataset['Extracurricular Activities'].map({'Yes': 1, 'No': 0}))

    dataset = dataset.dropna()
    dataset[dataset.columns.values] = StandardScaler().fit_transform(dataset[dataset.columns.values])

    return dataset


def lsr(x, y):
    theta = np.linalg.lstsq(x, y, rcond=None)[0]
    return theta


if __name__ == '__main__':
    dataset = pd.read_csv('dataset.csv')

    # setting: display all columns
    pd.set_option('display.max_columns', None)

    # task 1 & 2
    dataset = prepare_dataset(dataset)
    show_statistics(dataset)

    # task 3
    x = dataset[dataset.columns.values[:-1]]
    y = dataset[dataset.columns.values[-1]]
    x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)

    # task 4 & 5 & 6
    # model 1
    theta1 = lsr(x_train, y_train)
    y_pred1 = x_test.dot(theta1)
    print("Determination coef. (model #1) = ", r2_score(y_test, y_pred1))

    # model 2
    model_2_features = ['Sleep Hours', 'Extracurricular Activities']
    theta2 = lsr(x_train[model_2_features], y_train)
    y_pred2 = x_test[model_2_features].dot(theta2)
    print("Determination coef. (model #2) = ", r2_score(y_test, y_pred2))

    # model 3
    model_3_features = ['Hours Studied', 'Sample Question Papers Practiced', 'Previous Scores']
    theta3 = lsr(x_train[model_3_features], y_train)
    y_pred3 = x_test[model_3_features].dot(theta3)
    print("Determination coef. (model #3) = ", r2_score(y_test, y_pred3))

    # bonus task
    x_train['Synthetic Feature'] = x_train['Hours Studied'] + x_train['Previous Scores'] * 2.5
    x_test['Synthetic Feature'] = x_test['Hours Studied'] + x_test['Previous Scores'] * 2.5

    model_4_features = ['Synthetic Feature']
    theta4 = lsr(x_train[model_4_features], y_train)
    y_pred4 = x_test[model_4_features].dot(theta4)
    print("Determination coef. (model #4) = ", r2_score(y_test, y_pred4))