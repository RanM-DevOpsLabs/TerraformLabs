# Simple Flask Hello World Application

A basic Flask web application that serves "Hello, World!" and includes a health check endpoint.

## Setup and Installation

1. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Run the application:
   ```bash
   python app.py
   ```

3. Open your browser and visit:
   - `http://localhost:5000/` - Hello World page
   - `http://localhost:5000/health` - Health check endpoint

## Features

- **Root Route (`/`)**: Returns a simple "Hello, World!" message
- **Health Check (`/health`)**: Returns a JSON response indicating the app is running
- **Debug Mode**: Enabled for development (auto-reload on code changes)
- **Accessible**: Runs on all interfaces (0.0.0.0) on port 5000 