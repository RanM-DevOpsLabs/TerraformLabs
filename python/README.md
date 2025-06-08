# Simple Flask Hello World Application

A basic Flask web application that serves "Hello, World!" and includes a health check endpoint.

## Setup and Installation

### Option 1: Run with Python directly

1. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Run the application:
   ```bash
   python app.py
   ```

### Option 2: Run with Docker

1. Build the Docker image:
   ```bash
   docker build -t flask-hello-world .
   ```

2. Run the container:
   ```bash
   docker run -p 5000:5000 flask-hello-world
   ```

## Access the Application

3. Open your browser and visit:
   - `http://localhost:5000/` - Hello World page
   - `http://localhost:5000/health` - Health check endpoint

## Features

- **Root Route (`/`)**: Returns a simple "Hello, World!" message
- **Health Check (`/health`)**: Returns a JSON response indicating the app is running
- **Debug Mode**: Enabled for development (auto-reload on code changes)
- **Accessible**: Runs on all interfaces (0.0.0.0) on port 5000
- **Dockerized**: Includes Dockerfile for containerized deployment
- **Security**: Docker container runs as non-root user 