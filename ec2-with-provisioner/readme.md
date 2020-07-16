# Terraform AWS provider with provisioner action

Provision a EC2 instance, creating a private key for accessing and updating SO.

This private key can be accessed by following after applying:
```
terraform output priv_key > custom_key.pem && chmod 400 custom_key.pem
```
