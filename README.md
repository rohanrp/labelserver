# Label Server

A Windows service application that manages receipt printing operations to a cash drawer.

## Overview

Label Server is a background service that runs on Windows machines and handles communication with a receipt printer, which is configured as a cash drawer device. The service listens for print requests and manages the receipt printing workflow.

## Features

- **Windows Service**: Runs as a background service using NSSM (Non-Sucking Service Manager)
- **Receipt Printing**: Controls a receipt printer configured as a cash drawer
- **Network Configuration**: Configurable IP address and port for service communication
- **Service Management**: Includes scripts for easy installation, removal, restart, and stop operations

## Installation

1. Run the installation script:
   ```bash
   install.bat
   ```

2. The service will be installed and can be managed using Windows Service Manager or the provided batch files.

## Usage

### Service Management

- **Start the service**: Use Windows Services or `net start labelserver`
- **Stop the service**: `stop.bat`
- **Restart the service**: `restart.bat`
- **Remove the service**: `remove.bat`

### Configuration

Edit `configuration.txt` to set:
- **IP Address**: The network address for the service to listen on
- **Port**: The port number for service communication (default: 500)

Example configuration:
```
192.168.1.27
500
```

## Components

- **labelserver.exe**: Main service executable
- **PrintIt.exe**: Receipt printer/cash drawer control utility
- **nssm.exe**: Service manager for running the application as a Windows service
- **diag/**: Diagnostic utilities and tools

## Requirements

- Windows operating system
- Administrator privileges for service installation/removal
- Network connectivity to the receipt printer/cash drawer device

## Architecture

The service:
1. Starts as a background Windows service
2. Listens on the configured IP address and port
3. Receives print requests
4. Routes them to the receipt printer (cash drawer)
5. Handles the printing workflow

## License

See repository for license information.
