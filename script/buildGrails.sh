#!/bin/sh

set -euo pipefail

grails_version=$1
jdk_version=$2
update_latest=$3

grails_major_version=${grails_version:0:1}
grails_minor_version=${grails_version:0:3}
docker_build_home=/tmp/grails-docker

sudo rm -rf $docker_build_home && sudo mkdir $docker_build_home
sudo cp ../grails/"${grails_major_version}"/"jdk${jdk_version}.Dockerfile" ${docker_build_home}/Dockerfile
cd ${docker_build_home}

sudo build -t micrograils/grails:"${grails_version}" .
sudo docker tag micrograils/grails:"${grails_version}" grails/grails:"${grails_version}"
if [ "$update_latest" -eq 1 ]; then
  # tag for micrograils/grails
  sudo docker tag micrograils/grails:"${grails_version}" micrograils/grails:"${grails_minor_version}"
  sudo docker tag micrograils/grails:"${grails_version}" micrograils/grails:"${grails_major_version}"
  sudo docker tag micrograils/grails:"${grails_version}" micrograils/grails
  # tag for grails/grails
  sudo docker tag grails/grails:"${grails_version}" grails/grails:"${grails_minor_version}"
  sudo docker tag grails/grails:"${grails_version}" grails/grails:"${grails_major_version}"
  sudo docker tag grails/grails:"${grails_version}" grails/grails
fi

sudo docker push -a micrograils/grails
sudo docker push -a grails/grails

echo "$@"