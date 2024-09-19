# aws-lab
AWS Lab environment for testing using atmos tooling for terraform and GitHub Actions runner.
This was created using the atmos tooling for Terraform.

This lab is used in conjunction with aws-github repo to deploy ansible playbooks into the
EC2 instances using github actions and a OIDC github provider. The deployment is done over
SSM connections.

# Buildout
   ``` # atmos workflow buildall -f buildall ```
# Teardown
   ``` # atmos workflow teardown -f teardown ```

It does not teardown the codebuild project, you can uncomment this to do so. Keep in mind it will not
removed the github webhook. It must be deleted manually. I don't tear this down usually.

## VPC
This will create a VPC with two public subnets, two private subnets, and two Database Subnets. It will
Create an Internet Gateway for Public Subnets, and a Nat Gateway for the private subnets. There is no
internet access for the database subnets.

## SSM
It will setup SSM session management for the EC2 Hosts, putting endpoints into the private
subnets

## EC2
It will stand up two tiny EC2 instances in the private subnets.

## OIDC
It will create an Identify provider for Github, allowing gitub actions to deploy into the lab
environment

## ELB
Comming Soon

## Codebuild
This will setup a codebuild project that will fire up a github runner for deployments into the VPC.
It will also create the webhook into the repository. 

You will need to create a Github Token Secret and reference it in lab.yml. Also update
the codebuild/main.tf for the Repo that will recieve the code hook.


# Links
* https://atmos.tools/

