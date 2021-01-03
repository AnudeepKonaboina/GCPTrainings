# GoogleCloudPlatform

- [Contents](#Introduction)
  * [Notes](#Notes)
  * [Code](#Code)
  * [Deploy List Of Services On App Engine](#Deployment)


## Introduction
Google Cloud Platform is a suite of cloud computing services provided by Google in order to develop deploy and manage applications on cloud.
This project has the learnings and notes about Google cloud Platform and its services and also some code for deploying services into Google App engine and also a script for deploying a list of services into GAE.

## Notes
1.GCPTrainingNotes - https://github.com/AnudeepKonaboina/GoogleCloudPlatform/blob/main/notes/GCPTrainingNotes
2.GoogleAppEngine(Intro And Commands) - https://github.com/AnudeepKonaboina/GoogleCloudPlatform/blob/main/notes/GoogleAppEngine-IntroAndCommands
3.Installation of Gcloud CLI - https://github.com/AnudeepKonaboina/GoogleCloudPlatform/blob/main/notes/InstallingGcloudClient

## Code
Contains a project for deploying kafka service into Google App Engine 

#### Steps:
1.Install gcloud client using steps from https://github.com/AnudeepKonaboina/GoogleCloudPlatform/blob/main/notes/InstallingGcloudClient

2.Create a key and activate service account using that key using the commands in the IAM section of https://github.com/AnudeepKonaboina/GoogleCloudPlatform/blob/main/notes/GCPTrainingNotes

3.Open the kafkaservice directory - cd kafkaservice

4.Run the below command:
```sh
gcloud app --verbosity=debug -q deploy
```

## Deployment

#### Deploying a service or a list of services/apps on GAE:
->Using the deploy servies script we can deploy any number of services or applications on GAE using the following command:

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
