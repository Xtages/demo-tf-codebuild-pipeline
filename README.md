# Terraform basic pipeline

This repository doesn't intend to be self-explanatory. You can find the original post in http://xtages.com/blog/posts/terraform-basic-pipeline

## AWS CLI 
This directory contains a script that will create some of the resources in AWS that are mentioned in the blog.

## Codebuild
This directory contains 2 yaml files that should be added to the CodeBuild projects.
- `buildspec-pr-ou.yml` contains the commands to run when a PR is open or updated
- `buildspec-pr-merged.yml` contains the commands to run when a PR is merged

## docker
This directory contains a Dockerfile to create a Docker image that will contain:
- [Terraform `v0.14.10`](https://github.com/hashicorp/terraform/releases/tag/v0.14.10)
- [jq](https://stedolan.github.io/jq/) to return the plans to GitHub
- [AWS CLI `v2.1.36`](https://github.com/aws/aws-cli/releases/tag/2.1.36)

The `github-callback.sh` file will make the call to GitHub with the plan or the result of applying it 
as a payload. 
