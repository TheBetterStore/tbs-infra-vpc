#!/bin/bash

vpcCidr="10.1.0.0/16"
environment="prod"
stackName="tbs-infra-vpc"
region="ap-southeast-2"

aws cloudformation deploy --template-file ./cloudformation/template.yaml --stack-name $stackName \
  --parameter-overrides \
    Environment=${environment} \
    VPCCidr=$vpcCidr \
  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --region $region --no-fail-on-empty-changeset \
  --tags stackname=$stackName environment=$environment \
  --profile thebetterstore