# ATS-GKE-Terraform

## Overview

This Terraform project is designed to provision and manage resources on Google Cloud Platform (GCP). It automates the setup of a Google Kubernetes Engine (GKE) cluster, Google Artifact Registry, and a Service Account. This project provides the infrastructure as code (IaC) needed for your ATS application deployment on GCP.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Google Cloud Platform (GCP) Account**: You need a GCP account with the necessary permissions to create resources.

- **Terraform**: Install Terraform on your local machine. You can download it from [Terraform Downloads](https://www.terraform.io/downloads.html).

- **Google Cloud SDK**: Install the Google Cloud SDK (gcloud) to authenticate and interact with your GCP account. You can download it from [Google Cloud SDK](https://cloud.google.com/sdk/docs/install).

## Usage

Follow these steps to use this Terraform project:

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/eniolastyle/ATS-GKE-Terraform.git
   ```

2. Navigate to the project directory:

   ```bash
   cd ATS-GKE-Terraform
   ```

3. Initialize the Terraform configuration:

   ```bash
   terraform init
   ```

4. Create a `terraform.tfvars` file with the required variables. You can use the provided `variables.tf` as a reference for input variables.

5. Apply the Terraform configuration to create the resources:

   ```bash
   terraform apply
   ```

6. Review the plan and confirm by entering `yes` when prompted.

## Resources Created

- **Google Kubernetes Engine (GKE) Cluster**: The GKE cluster provides a managed Kubernetes environment for deploying containerized applications.

- **Google Artifact Registry**: Artifact Registry is used for storing container images.

- **Service Account**: A service account is created with the necessary roles and permissions.

## Cleaning Up

To destroy the resources created by Terraform and release the associated billing charges, you can run:

```bash
terraform destroy
```

## Contributing

Contributions are welcome! If you have suggestions, improvements, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
