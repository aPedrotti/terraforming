#!/bin/bash

terraform destroy -auto-approve

rm -rf .terraform

rm -f private_key.pem

rm -f instance_ip

rm -f plan