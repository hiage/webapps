SHELL := /bin/bash

.PHONY: help test clean

help: ## Help menu
        @echo "available target list:"
        @echo "  help                       : menu help"

        @echo "  build-dev                  :"
        @echo "  build-stg                  :"
        @echo "  build-prod                 :"
		@echo "  deploy-local               :"
        @echo "  deploy-dev                 :"
		@echo "  deploy-stg                 :"
		@echo "  deploy-prod                :"

pull:
        git pull

reset:
        git reset --hard; git clean -df
        git pull

build-dev:
		docker build backend/ -t hiage/backend:development
		docker push hiage/backend:development
		docker build frontend/ -t hiage/frontend:development
		docker push hiage/frontend:development

build-stg:
		docker build backend/ -t hiage/backend:staging
		docker push hiage/backend:staging
		docker build frontend/ -t hiage/frontend:staging
		docker push hiage/frontend:staging
	
build-prod:
		docker build backend/ -t hiage/backend:production
		docker push hiage/backend:production
		docker build frontend/ -t hiage/frontend:production
		docker push hiage/frontend:production

deploy-dev:
		kubectl create ns development
		helm install -n development backend-development helm/backend/ -f helm/backend/values-development.yaml
		helm install -n development frontend-development helm/frontend/ -f helm/frontend/values-development.yaml

deploy-stg:
		kubectl create ns staging
		helm install -n staging backend-staging helm/backend/ -f helm/backend/values-staging.yaml
		helm install -n staging frontend-staging helm/frontend/ -f helm/frontend/values-staging.yaml

deploy-prod:
		kubectl create ns production
		helm install -n production backend-production helm/backend/ -f helm/backend/values-production.yaml
		helm install -n production frontend-production helm/frontend/ -f helm/frontend/values-production.yaml

deploy-local:
		chmod +x deploy-local.sh
		./deploy-local.sh