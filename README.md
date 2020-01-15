# Capcito Pipelines Image

## Build the image
This usually takes ~3 minutes, just let it finish before moving on to the next step. 
> docker build -t capcito/bitbucket-pipelines .

## Push to Docker Hub
Once the build is done, let's submit it to Docker Hub.

Please note that you must be signed in and added as a collaborator.
> docker push capcito/bitbucket-pipelines