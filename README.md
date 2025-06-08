# TerraformLabs - Flask Hello World with Terraform

This repository contains a simple Flask "Hello World" application containerized with Docker and deployed using Terraform.

## Prerequisites

Before getting started, ensure you have the following tools installed on your system:

### 1. Terraform

### 2. Docker

### 3. Python

## Getting Started

Follow these steps to build and deploy the Flask application:

### Step 1: Build Docker Image
From the repository root directory, build the Docker image:

```bash
docker build -t flask-hello-world python/.
```

### Step 2: Initialize Terraform
Initialize Terraform to download required providers and modules:

```bash
terraform init
```

### Step 3: Validate Configuration
Validate your Terraform configuration files:

```bash
terraform validate
```

### Step 4: Apply Infrastructure
Deploy the infrastructure and application:

```bash
terraform apply
```

*Note: Terraform will show you a plan of what will be created. Type `yes` when prompted to confirm the deployment.*

### Step 5: Access the Application
Once the deployment is complete, navigate to your Flask application:

🌐 **[http://localhost:5000](http://localhost:5000)**

You should see the "Hello, World!" message.

Additional endpoints:
- Health check: `http://localhost:5000/health`

## Cleanup

To destroy the infrastructure and clean up resources:

```bash
terraform destroy
```

## Project Structure

```
TerraformLabs/
├── README.md                 # This file
├── main.tf                   # Main Terraform configuration
├── providers.tf              # Terraform providers configuration
├── python/                   # Flask application directory
│   ├── app.py               # Flask application code
│   ├── requirements.txt     # Python dependencies
│   ├── Dockerfile           # Docker configuration
│   ├── .dockerignore       # Docker ignore file
│   └── README.md           # Flask app specific documentation
└── terraform files...       # Other Terraform state files
```

## Troubleshooting

- **Docker build fails**: Ensure Docker is running and you have sufficient permissions
- **Terraform init fails**: Check your internet connection and Terraform version
- **Port 5000 already in use**: Stop any other services running on port 5000
- **Permission denied**: On Linux/macOS, you may need to run Docker commands with `sudo` or add your user to the docker group