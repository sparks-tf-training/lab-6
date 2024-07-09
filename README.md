# Terragrunt Discovery

## Description

This repository contains a simple example of how to use Terragrunt to manage multiple Terraform modules.

## Prerequisites

* Terraform installed on your machine.
* The Azure CLI logged in to your Azure account.

## Multiple environments

1. Clone this repository to your local machine.
2. Install Terragrunt on your machine. See https://terragrunt.gruntwork.io/docs/getting-started/install/
3. Navigate to the `staging` directory.
4. Run the following command to initialize the Terragrunt configuration:

    ```bash
    terragrunt init
    ```
5. Run the following command to apply the Terraform configuration:

    ```bash
    terragrunt apply
    ```
6. Now you should be able to have a new network created in your Azure subscription.
7. Navigate to the `production` directory.
8. Extend the `terragrunt.hcl` file to include the parent module and use a different name for the network.
   See https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#blocks for more information.
9. Run the following command to initialize the Terragrunt configuration:

    ```bash
    terragrunt init
    ```
10. Run the following command to apply the Terraform configuration:

    ```bash
    terragrunt apply
    ```

## Implement Remote State

1. Get information of the storage account created in the previous lab.
2. Update the terragrunt.hcl file in the root directory to include the remote state configuration.
   See https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/ for more information.
   Use a state named after the environment.
3. Reapply the Terraform configuration in the `staging` directory. You should see the state file in the storage account (by running `az storage blob list --container-name tfstate --account-name <storage_account_name>`).

## Add some resources on the staging environment

1. Create a `pip.tf` file in the `staging` directory to include a new public IP address.
2. Run the following command to apply the Terraform configuration:

    ```bash
    terragrunt apply
    ```

## Clean up

1. Navigate to the `staging` directory.
2. Run the following command to destroy the Terraform configuration:

    ```bash
    terragrunt destroy
    ```
3. Navigate to the `production` directory.
4. Run the following command to destroy the Terraform configuration:

    ```bash
    terragrunt destroy
    ```
