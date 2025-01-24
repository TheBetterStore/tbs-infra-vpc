#!/bin/bash

appName="tbs-infra-vpc-natgw"
environment="prod"
stackName="$appName-$environment"
region="ap-southeast-2"

aws cloudformation deploy --template-file ./cloudformation/template-natgw.yaml --stack-name $stackName \
  --parameter-overrides \
    Environment=${environment} \
  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --region $region --no-fail-on-empty-changeset \
  --tags appName=$appName stackname=$stackName environment=$environment \
  --profile thebetterstore