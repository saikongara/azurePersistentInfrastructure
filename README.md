# Data Engineering on Azure

This GitHub repository houses terraform script to deploy Azure persistent Infrastructure to support Big Data operations for Data Engineering using Azure Databricks (Spark).

#### The resources deployed as part of this Infrastructure-as-code are;
> - **Azure Resiurce Group** - The logical wrapping of application specific resources together.
> - **Azure Datalake Storage** - This stores data in the form of `Files` and `Blobs`.
> - **Azure Databricks** - The Computation layer that provided `Spark` for Data Engineering.
> - **Azure Virtual Network** - The Network restrictions that restricks `open internet access` for Data Engineering infrastructure.
> - **Azure Subnet** - The resource or application level restrictions to restrict traffic between Infrastructure components.
> - **Azure Network Security Group (NSG)** - The security groups that houses rules to restrict `ingress` and `egress` network `traffic`.
> - **Azure Network security rules** - The `rules` inside NSGs to restrict application specific Ingress/Egress traffic.
> - **Azure NSG Subnet association** - The association between `Azure Subnet` and `Azure NSGs` to apply specific rules to specific applications.
> - **Azure SQL Server** - The SQL server to house `SQL databases` on Azure.
> - **Azure Synapse** - The `Data warehousing` layer on SQl server to store and process huge amount of data on azure.
> - **Azure Virtual machine** - The `Linux Virtual machines` to support Data Engineering needs and Visualization.
> - **Azure Keyvault** - The Vault to store `Keys`, `Secrets` and `Certificate` on Azure instead of hard coding.

### Key Notes:
1. The repository also houses `Dockerfile` to support `Jenkins` slave to support `DevOps` automating.
1. `PowerShell` scripts to provision access uisng `az cli commands` and modify resource level `configuration`.
1. `Jenkins` file to support automated `DevOps` deployment integrated with `GitHub`.

## Branching
Latest emhancements will be updated to Master branch for release.
1. `master` branch
    > 1. merge needs `Pull Request` review/approval.
    > 1. Once reviewed and merged with `develop`, raise `Pull Request` for `master` for enhancement to be made.

1. `develop` branch
    > 1. Create Enhancement wise branches out of it.
    > 1. Work enhancements wise contribution.
    > 1. Push latest code with `Pull Requests` and get reviewed.
    > 1. merge needs `Pull Requests` review/approval.