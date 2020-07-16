#!/bin/bash

KEY="private_key.pem"
ADDRESS="instance_ip"

terraform init

terraform plan -out plan
if [ -f "plan" ]; then
  terraform apply -auto-approve "plan"
  if [ -f $KEY and $ADDRESS ]; then
    ssh -i $KEY ubuntu@`cat $ADDRESS`
else
  echo "something went wrong."
fi

