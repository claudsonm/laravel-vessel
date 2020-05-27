# Laravel Vessel

Docker container receptacle to nicely receive a Laravel application.

## Building and Publishing to Docker Hub

To generate a new version use the following commands:

```
docker build -t laravel-vessel docker/containers/laravel-vessel
docker login
docker tag laravel-vessel claudsonm/laravel-vessel:{version}
docker push claudsonm/laravel-vessel:{version}
```
