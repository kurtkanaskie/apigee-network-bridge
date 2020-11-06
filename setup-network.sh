#!/bin/sh
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

./check-prereqs.sh $1 $2 $3

RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

project=$1
region=$2
vpc_name=$3

./setup-gcs.sh $1 $2
RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

./setup-mig.sh $1 $2 $3 $4
RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

#while true; do
#    read -p "Do you to proceed with the creation and configuration of GCLB?" yn
#    case $yn in
#        [Yy]* ) break;;
#        [Nn]* ) exit 0;;
#        * ) echo "Please enter yes or no.";;
#    esac
#done

#./setup-loadbalancer.sh $1 $2 $3
#RESULT=$?
#if [ $RESULT -ne 0 ]; then
#  exit 1
#fi

#exit 0

