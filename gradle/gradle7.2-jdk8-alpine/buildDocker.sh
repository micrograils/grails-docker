#!/bin/sh

version=7.2-jdk8-alpine

mkdir build
cp Dockerfile build/
cd build

sudo docker build -t micrograils/gradle:$version .

cd .. || exit
rm -rf build/