# Continuous Integration with GitHub Actions and HashiCorp Terraform

_[Based on this blog post](https://wahlnetwork.com/2020/05/12/continuous-integration-with-github-actions-and-terraform/)_

## Overview

In this scenario, continuous integration of an AWS environment is desired. Configuration is managed via HashiCorp Terraform. Continuous Integration is managed via GitHub Actions. By loading the necessary Terraform configuration files into this repository along with two GitHub Workflows, the Terraform files can be used to Plan and Apply into the target environment.

**NOTE**: GitHub Actions are disabled for this repository to prevent abuse. You can view previous runs [here](/actions).

## Details

This repository contains two GitHub Workflow files:

* [Terraform Plan](/.github/workflows/tf-plan.yml) - Triggered by any Pull Request.

* [Terraform Apply](/.github/workflows/tf-apply.yml) - Triggered by a Push into the `master` branch.

## Terraform Plan

* Checks the Terraform configuration for security vulnerabilities with [tfsec](https://github.com/liamg/tfsec).

* Constructs AWS credentials using a Secrets stored in this repository.

* Loads the Terraform CLI wrapper with [Setup Terraform](https://github.com/marketplace/actions/hashicorp-setup-terraform)

* Terraform CLI performs an `Init` and `Plan` based on the pull request's configuration.

* GitHub Actions Bot adds a comment to the pull request with the results. Example: [Pull Request 1](https://github.com/WahlNetwork/github-action-terraform/pull/1)

You can view pervious Terraform Plan workflows [here](https://github.com/WahlNetwork/github-action-terraform/actions?query=workflow%3A%22Terraform+Plan%22).

## Terraform Apply

* Constructs AWS credentials using a Secrets stored in this repository.

* Loads the Terraform CLI wrapper with [Setup Terraform](https://github.com/marketplace/actions/hashicorp-setup-terraform)

* Terraform CLI performs an `Init` and `Apply` based on the new push configuration.

You can view pervious Terraform Apply workflows [here](https://github.com/WahlNetwork/github-action-terraform/actions?query=workflow%3A%22Terraform+Apply%22).

## Credentials

Credentials should be stored in the `user\.aws\credential` file using Secrets stored in this repository.

Example:

```bash
mkdir -p ~/.aws
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = ${{ secrets.AWS_ACCESS_KEY_ID }}" >> ~/.aws/credentials
echo "aws_secret_access_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}" >> ~/.aws/credentials
```
