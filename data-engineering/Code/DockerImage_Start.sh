aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 329009514794.dkr.ecr.ca-central-1.amazonaws.com && \
docker run --rm -ti  -e ROOT=TRUE -v $(pwd):/home/rstudio 329009514794.dkr.ecr.ca-central-1.amazonaws.com/raja-model:avm R