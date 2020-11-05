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

# endpoint is not necessary to clean up instances

echo $1
echo $2
echo $3

project=$1
region=$2
vpc_name=$3

echo "project id is " $1 
echo "region name is " $2
echo "VPC is " $3

if [ -z "$1" ]
  then
    echo "project id is a mandatory parameter."
    exit 1
fi

if [ -z "$2" ]
  then
    echo "region name is a mandatory parameter."
    exit 1
fi

if [ -z "$3" ]
  then
    echo "VPC is a mandatory parameter."
    exit 1
fi

./check-prereqs.sh $1 $2 $3
RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

project=$1
region=$2

./cleanup-gcs.sh $1 $2
RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

./cleanup-loadbalancer.sh $1 $2
RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

./cleanup-mig.sh $1 $2
RESULT=$?
if [ $RESULT -ne 0 ]; then
  exit 1
fi

