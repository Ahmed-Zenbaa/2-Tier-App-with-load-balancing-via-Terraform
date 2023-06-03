# 2-Tier-App-via-Terraform
######################################################################################

	  This 2-Tier App via Terraform project
     	     was created By: Eng/Ahmed Zenbaa

######################################################################################

Note the following:

1)make sure to change S3 Bucket Name as it's a unique name.
2)make sure to make changes to (region) or any resources names you want changed.
3)run:     terraform init
	   terraform plan
	   terraform apply
     in the directory (pre) first
4)make sure resources are provisioned correctly.
5)run:      terraform init
	    terraform plan
	    terraform apply
     in the dircory (2-Tier-App-via-Terraform)
6)make sure resources are provisioned correctly.

######################################################################################

NOW:

-you should have 2 Ec2 instances running the App with a load balancer on them.
-you should have 2 Ec2 instances ruuning the DB with a load balancer on them.
-state file should be stored in the S3 Bucket.
-statelock file should be stored in the DynamoDB.


######################################################################################

Road-Map:

!)Provision S3 Bucket and DynamoDB Table.
2)Provision a VPC with IGW and route tables.
3)Provision Four subnets (Two public) and (Two private)inside the VPC.
4)Provision 2 EC2 Instances (App) inside 2 public subnets.
5)Provision Application Load Balancer to balance load between the 2 (App) EC2 Instances.
6)Provision Target Group for The Application Load Balancer and have the (App) EC2 Instances as his targets.
7)Provision 2 EC2 Instances (DB) inside 2 private subnets.
8)Provision Application Load Balancer to balance load between the 2 (DB) EC2 Instances.
9)Provision Target Group for The Application Load Balancer and have the (DB) EC2 Instances as his targets.
8)Store the state file on (S3 Bucket) and lock it by (DynamoDB).


######################################################################################

Hope you find this project helpful :))
