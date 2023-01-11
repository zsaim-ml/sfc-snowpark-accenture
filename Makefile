# Created By Luis Enrique Fuentes Plata

SHELL = /bin/bash

include .env

.DEFAULT_GOAL := help

checker:
     $(if $(SNOWFLAKE_ACCOUNT),,$(error Variable SNOWFLAKE_ACCOUNT must be set in .env file)) \
     $(if $(SNOWFLAKE_PASSWORD),,$(error Variable SNOWFLAKE_PASSWORD must be set in .env file))

services:
	@ for x in {1..5}; do echo Creating services ....; sleep 2; done

url:
	@ docker logs jupyter-server

.PHONY: run
run: ## (Local): Test locally
	@ docker-compose up -d --build
	@ $(MAKE) services
	@ $(MAKE) url

.PHONY: clean
clean: ## (Local): Clean Docker
	@ docker-compose down -v --rmi all

.PHONY: application
application: ## (Local): Run a Streamlit application
	@ streamlit run server/src/01_ml_fraud_detection/application.py

help:
	@ echo "Please use \`make <target>' where <target> is one of"
	@ perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'
