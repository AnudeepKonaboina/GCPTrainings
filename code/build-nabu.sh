usage() { 
   echo ""
   echo "Usage: $0 --base-image-name <image-name> --version <version> --path <docker-fie-path> --destination-repo <repo>"
   echo -e "\t--image-name nabu-base-image"
   echo -e "\t--version v0.2.7"
   echo -e "\t--path /nabu-docker/nabu-base"
   echo -e "\t--destination-repo us.gcr.io/modak-nabu"
   echo -e "\t--services-s 'botworks fireshots' "
   exit 1 # Exit script after printing help
}

build_image() {
	build_base_image_and_push && build_child_images_and_push
}

build_base_image_and_push() {
	docker build -t $name:$version -p $path && docker tag $name:$version $repo/$name:$version && docker push $repo/$name:$version;
}

build_child_images_and_push() {
	for service in $services ; do
		cd service;
		docker build -t $service:$version . && docker tag $service:$version $repo/$service:$version && docker push $repo/$service:$version; 
}


while [ $# -gt 0 ] ; do
    case $1 in
    -n | --image-name) name="$2" ;;
    -v | --version) version="$2" ;;
	-p | --path) path="$2" ;;
	-d | --destination-repo) repo="$2" ;;
	-s | --services-list) services="$2" ;;
    esac
    shift
done

if [ -z "$name" ] || [ -z "$version" ] || [ -z "$path" ] || [ -z "$repo" ] || [ -z "services" ]
then
   echo "Some or all of the parameters are empty";
   usage
else
	build_image
fi


