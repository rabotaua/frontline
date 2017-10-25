# Frontline

Image used to build front end assets and deploy them to AWS S3

# Versions

`latest` is build from `node`

`alpine` is build from `node:alpine`

## Local

```sh
docker run -it --rm -v $PWD:/code -w /code rabotaua/frontline sh
```

## Pipelines

```yml
image: rabotaua/frontline
options:
  max-time: 5
pipelines:
  branches:
    dev:
      - step:
          name: "build and deploy 'dev' branch, test merge conflicts"
          caches:
            - node
          script:
            - npm install
            - npm run dist
            - aws s3 sync --delete dist s3://rua-assets-dev/fedor
            - git remote add upstream https://$BITBUCKET_READONLY_USERNAME:$BITBUCKET_READONLY_PASSWORD@bitbucket.org/$BITBUCKET_REPO_OWNER/$BITBUCKET_REPO_SLUG.git
            - git fetch upstream
            - git checkout master
            - git merge upstream/dev
    master:
      - step:
          name: "build and deploy 'master' branch"
          caches:
            - node
          script:
            - npm install
            - npm run dist
            - aws s3 sync --delete dist s3://rua-assets-frankfurt/fedor
```

**IMPORTANT**: double check AWS S3 bucket path, otherwise `--delete` option may corrupt everything