#!/bin/bash
NODE=$1

echo FROM selenium/$NODE > ./Dockerfile
cat ./Dockerfile.txt >> ./Dockerfile
