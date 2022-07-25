### Version of Terraform used 
Terraform v1.1.1
### Please run this command to download tfenv to use as a  switcher for terraform versions
```
bash localscript.sh 
tfenv install 1.1.1
tfenv use 1.1.1
```
---
# Usage

### To create resources please run this command
```
terraform apply  -var-file  envs/dev.tfvars
```
# To access web server please use clb_dns_name output that is given by Elastic Load Balancer
