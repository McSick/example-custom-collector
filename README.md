# Example Custom Collector

Use this repo to see how to create your own custom collector.  This was specifically made to showcase the dd-receiver.

## Changes for you

- In the build-docker.sh file, change to push to your own docker repository. 
- builder.yml update to the latest version for components
- Dockerfile make sure you are using the correct OCB builder version

For k8s  

- secret.yaml add your Honeycomb API Key
- custom-collector.yaml change the docker image for the deployment to the one you just created

## Order

1. Make above relevant Changes
2. Build the docker image and push to your own docker repository

If using k8s 

3. deploy the secret to your cluster
4. deploy the custom-collector.yaml to deploy the configmap, service, and deployment