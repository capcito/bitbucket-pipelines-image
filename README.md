# Capcito Pipelines Image

## Step 1 Build the image
Start by running the build step. It should take about 3 minutes.
> docker build -t capcito/bitbucket-pipelines .


## Step 2 Tag the image
In order to not break the production pipelines when upgrading to a new PHP version or making major upgrades, use tags. 
Once building is done, note down the hash of the image, e.g. `=> writing image sha256:c03a565b2a0ea4d29ba912428445a9cf7afe40822f533437f0b5180cbd56a500`.

Next, decide upon a tag. It should be based on PHP version, e.g. php8.1. Tag the image
> docker tag [HASH] capcito/bitbucket-pipelines:[TAG]

For example:

> c03a565b2a0ea4d29ba912428445a9cf7afe40822f533437f0b5180cbd56a500 capcito/bitbucket-pipelines:php8.1


## Step 3 Push to Docker Hub
Submit the image to the Docker Hub. Note that you must be signed in and added as a collaborator.

> docker push capcito/bitbucket-pipelines:[TAG]

For example:
> docker push capcito/bitbucket-pipelines:php8.1
