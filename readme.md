This is the docker container used to run azurehound with a managed system identity.

See this blogpost for more details: https://falconforce.nl/automating-things-0x01-azurehound-for-blue-teams/

To build the container, run:

```
docker build .
```

I had some issues with cached layers which were not properly fetching the latest version of the customized bloodhound. If you encounter the same issue, you can try:

```
docker builder prune -f -a && docker build .
```

This removes everything from your builder cache.