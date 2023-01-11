# Machine Learning with Snowpark Python: - Credit Card Approval Prediction

## 1. Overview
Python is the language of choice for Data Science and Machine Learning workloads. Snowflake has long supported Python via the Python Connector, allowing data scientists to interact with data stored in Snowflake from their preferred Python environment. This did, however, require data scientists to write verbose SQL queries. To provide a more friendly, expressive, and extensible interface to Snowflake, we built Snowpark Python, a native Python experience with a pandas and PySpark-like API for data manipulation. This includes a client-side API to allow users to write Python code in a Spark-like API without the need to write verbose SQL. Python UDF and Stored Procedure support also provides more general additional capabilities for compute pushdown.

Snowpark includes client-side APIs and server-side runtimes that extends Snowflake to popular programming languages including Scala, Java, and Python. Ultimately, this offering provides a richer set of tools for Snowflake users (e.g. Python's extensibility and expressiveness) while still leveraging all of Snowflake's core features, and the underlying power of SQL, and provides a clear path to production for machine learning products and workflows.

A key component of Snowpark for Python is that you can "Bring Your Own IDE"- anywhere that you can run a Python kernel, you can run client-side Snowpark Python. You can use it in your code development the exact same way as any other Python library or module. In this quickstart, we will be using Jupyter Notebooks, but you could easily replace Jupyter with any IDE of your choosing.

Throughout this quickstart, we will specifically explore the power of the Snowpark Python Dataframe API, as well as server-side Python runtime capabilities, and how Snowpark Python can enable and accelerate end-to-end Machine Learning workflows.

## Prerequisites
* Working knowledge of Python
* Familiarity with Snowflake

## What You'll Learn
* Loading and transforming data via Snowpark
* Defining Stored Procedures for non-SQL-based Data Transformations
* Defining Stored Procedures for training different machine learning models
* Defining User Defined Functions for distributed scoring of machine learning models
* Using hyper paratemer tuning in Stored Procedures

## What You'll Need
* A free Snowflake Trial Account
* Anaconda Integration enabled by ORGADMIN
* Python 3.8
* Jupyter Notebook

## What You'll Build
You will build an end-to-end data science workflow leveraging Snowpark for Python

to load, clean and prepare data
to train different machine learning models using Python Stored Procedures
to deploy the trained models in Snowflake using Python User Defined Functions (UDFs)

# Use-Case: Credit Card Approval Prediction
You are part of a team of data engineers and data scientists at a banking company that has been tasked to identify high-risk customers using a machine learning based solution. The goal is to give a recommendation to either approve or reject the issueing of a credit card.

To build this, you have access to customer demographic and credit history data. Using Snowpark, we will ingest, analyze and transform this data to train a model that will then be deployed inside Snowflake to score new data.

The dataset you are using is part of a Kaggle competition that can be found here:

* [Kaggle](https://www.kaggle.com/datasets/rikdifos/credit-card-approval-prediction)
