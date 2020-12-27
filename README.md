# GCPTrainings

## Installing/Deploying a service or a list of services/apps on GAE:
->Using the deploy servies script we can deploy ny number of services or applications on GAE using the following command:

``sh deploy_gae_service.sh -s "<list of services>" -p "<path to the main dir>"
``

Example:
```
single service:
===============
sh deploy_gae_service.sh -s "kafkaservice" -p "/project/code"

List of services:
================
sh deploy_gae_service.sh -s "service1 service2" -p "/project/code"

```