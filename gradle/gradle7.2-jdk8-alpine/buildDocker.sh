#!/bin/sh

version=gradle7.2-jdk8-alpine

mkdir build && copy Dockerfile build/ && cd build

sudo docker build -t micrograils/gradle:$version .