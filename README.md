![tf](tfnew.jpg)
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
### What happens under the hood:

🔍 Parses Configuration Files
* Reads all .tf files to identify providers, modules, backends, and required versions.

📦 Downloads Provider Plugins
* Contacts the Terraform Registry (or a custom provider source).
* Downloads provider binaries (e.g. hashicorp/aws) to .terraform/providers/.

🔗 Initializes Backend
* If a backend (e.g., s3, gcs, remote) is defined:
* Initializes connection (e.g. checks bucket and credentials).
* May create lock files or state files if they don’t exist.
* If using local backend, creates terraform.tfstate locally.

📁 Prepares .terraform/ Directory
* Stores:
* Provider binaries.
* Module source code (downloaded from Git, local path, registry, etc.).
* Backend metadata.
* Dependency lock file (.terraform.lock.hcl).

### Step 3: Validate Configuration
Validate your Terraform configuration files:

```bash
terraform validate
```
### What happens under the hood:

🔍 Parses All .tf Files
* Uses the internal HCL parser to read and build the configuration structure.

🧠 Validates Schema and Syntax
* Ensures:
* Required attributes are present.
* Data types match.
* References to variables, resources, locals, etc., are valid.

⚠️ Does Not Contact Provider APIs
* Purely static validation.
* No real-world checks (e.g., region existence, API quotas).

### Step 4: Plan
Creates an execution plan showing what will change:

### What happens under the hood:

📥 Loads State
* Reads the current state from:
* terraform.tfstate (local).
* Remote backend (e.g., S3 with DynamoDB lock).

🔁 Refreshes Resource States
* Calls each provider’s API to refresh current resource data.
* Reconciles config with real-world state.

⚙️ Diffs Desired vs Actual
* Compares:
  * Configuration (.tf) ← desired
  * Refreshed state ← current
* Calculates:
  * Resources to create, update, or destroy.

🔒 Checks for Drift
* Drift = difference between real infra and state file.

📝 Outputs a Plan
* Shows what changes will occur

### Step 4: Apply Infrastructure
Deploy the infrastructure and application:

```bash
terraform apply
```

### What happens under the hood:

🔁 Re-evaluates Configuration
* Parses .tf files again.
* Re-checks dependencies and order of resources.

📥 Reads & Locks State
* Loads current state file.
* Locks it to prevent concurrent modifications (esp. important with remote backends like S3 + DynamoDB).

🔧 Executes Resource Changes
* Sequentially or in parallel (as DAG) applies changes:
  * Creates new resources.
  * Updates changed ones.
  * Deletes obsolete ones.
* Uses provider SDKs (e.g. AWS SDK, Azure SDK) to make real API calls.

🪵 Logs Output and Errors
* Displays live updates.
* Logs failures per resource.

💾 Writes Updated State
* Updates terraform.tfstate with new resource states and metadata.
* Unlocks the state.
---
ℹ️ About the state file:
<i>State file acts as a storage file for terrafom. If we'll take a look inside we'll see a .json formatted file, and we can recognize the resource that were already created using the `apply` command.</i>

If we'll take a look inside tfstate file, we can two main resources where created: the information about our created docker image:
1. type: docker_container
2. type: docker_image

If for example - we'll change the docker image name, and type apply again, terraform we'll comare newly passed paramaters to the tfstate, and see if something needs to change, in this case, it would point that the name will be updated. 
```json
{
      "mode": "managed",
      "type": "docker_container",
      "name": "flask_hello_world_container",
      "provider": "provider[\"registry.terraform.io/kreuzwerker/docker\"]",
      "instances": [
       ...
      ], 
      "mode": "managed",
      "type": "docker_image",
      "name": "flask_hello_world_image",
      "provider": "provider[\"registry.terraform.io/kreuzwerker/docker\"]",
      "instances":
    }
```


### Diagram:
```bash
 [ .tf files ]      [ .tfstate ]
     |                   |
     v                   v
     -----> Refresh & lock state
                    |
                    v
            Execute provider APIs
                    |
                    v
         Apply changes to real infra
                    |
                    v
        Write new state & unlock file
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