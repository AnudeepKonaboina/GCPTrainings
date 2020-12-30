#!/bin/bash
usage() { echo "Usage: $0 args to be used are [-s <string>] [-p <string>] " 1>&2; exit 1; }

deploy(){
for service in $services; do
	echo "Dir $service"
    #Go int0 service directory
    cd $service;
    #check wheteher insatnces exist or not
    gcloud app instances list -s $service --filter="RUNNING"

    if [ $? -eq 0];then
    	echo "Deleting and deploying service $val";
    	gcloud app -q services delete $service && gcloud app --verbosity=debug -q deploy;
    else 
    	echo "Deploying service $val"
    	gcloud app --verbosity=debug -q deploy;
    fi
done
}

while getopts ":s:p:" opt; do
    case "${opt}" in
        s)
            services=${OPTARG}
            ;;
        p)
            path=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))



if [ -z "${services}" ] || [ -z "${path}" ]; then
    usage
else
	cd $path;
    deploy
fi
