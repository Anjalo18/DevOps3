# Ansible with Docker - Project Overview

## Description

This project aims to set up a multi-container environment using Docker, Docker Compose, and Ansible. The project creates virtual machines (`vm1`, `vm2`, `vm3`) within Docker containers and dynamically generates an inventory file for use with Ansible. 

**Note:** The project is currently incomplete and in a development state.

---

## Prerequisites

Before starting, ensure you have the following installed:
- **Docker**
- **Docker Compose**
- **Ansible**

---

## How to Set Up

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/Anjalo18/DevOps3.git
cd DevOps3
```

---

### Step 2: Build and Start the Containers

Use Docker Compose to build the images and start the containers:

```bash
sudo docker compose build
sudo docker compose up -d
```

This will:
1. Create three containers (`vm1`, `vm2`, `vm3`) using the `Dockerfile`.
2. Map ports `2201`, `2202`, and `2203` to the respective containers' SSH ports.

---

### Step 3: Generate the Ansible Inventory File

Run the `inventory.sh` script to generate an `inventory.ini` file with the IP addresses of the containers:

This script will:
1. Inspect the running Docker containers (`vm1`, `vm2`, `vm3`) for their IP addresses.
2. Dynamically update `inventory.ini` with the IPs in the `[myhosts]` group.

---

## Project Files

### `Dockerfile`

The `Dockerfile`:
- Uses an Ubuntu base image.
- Installs `openssh-server` to enable SSH.
- Configures SSH to use the default `ubuntu` user with the password `password`.
- Exposes port `22` for SSH communication.
- Copies the `inventoty.sh` script into the container and makes it executable.

---

### `docker_compose.yml`

The `docker-compose.yml` file:
- Defines three services (`vm1`, `vm2`, `vm3`).
- Builds all services using the same `Dockerfile`.
- Maps custom SSH ports (`2201`, `2202`, `2203`) to each container.

---

### `inventory.ini`

The `inventory.ini` file:
- Contains dynamically generated IP addresses of the Docker containers.
- Used by Ansible for managing and automating tasks on the containers.

---

### `inventoty.sh`

The `inventoty.sh` script:
- Retrieves the IP addresses of the containers (`vm1`, `vm2`, `vm3`).
- Updates the `inventory.ini` file with these IP addresses in the `[myhosts]` group.
- Ensures Ansible can target these containers for automation tasks.

---

## Next Steps

### Improvements to be Made:
1. **Complete Ansible Integration**: Add playbooks and roles for Ansible to automate tasks on the Docker containers.
2. **Error Handling**: Improve error handling in the `inventoty.sh` script to manage edge cases (e.g., missing containers).
3. **Dynamic Configuration**: Automate more aspects of the setup, such as Ansible playbook execution.

---

## Useful Commands

### Docker Commands:
- **Build the containers**: `sudo docker compose build`
- **Start the containers**: `sudo docker compose up -d`
- **Stop and remove the containers**: `sudo docker compose down`
- **Inspect container IPs**: `docker inspect <container-name>`

### Ansible Commands:
- **Ping all hosts in inventory**: `ansible -i inventory.ini all -m ping`

---
