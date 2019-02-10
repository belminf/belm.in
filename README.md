My website.

## Deploying
Use helm:
```
helm install -f override.yaml -n website chart/
```

## Update
### Content (docker image)
Update the repo which will trigger creation of new image:

[Docker Hub](https://cloud.docker.com/repository/docker/belminf/personal_website/builds)

Then, roll the update via deployments.

### Kubernetes
If the chart is updated, need to push that out:

```
helm upgrade -f override.yaml website chart/
```
