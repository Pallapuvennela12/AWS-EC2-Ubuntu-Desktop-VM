# AWS-EC2-Ubuntu-Desktop-VM
# Install a Hypervisor and Create a VM with a Heavyweight Operating System

A cloud virtualization practical using AWS EC2 to provision an Ubuntu 24.04 LTS virtual machine on the AWS Nitro Hypervisor, configure a lightweight XFCE4 graphical desktop environment, and connect remotely from Windows via Remote Desktop Protocol (RDP).

## Objective
Provision a virtual machine running a heavyweight Linux operating system (Ubuntu 24.04 LTS) on AWS EC2 Free Tier (t3.micro), configure the XFCE4 desktop environment with xrdp, establish remote GUI access on TCP Port 3389, and verify the allocated virtual hardware resources.

## Presenter Details
- **Name:** Vennela Pallapu
- **Roll No:** 2410080070
- **Department:** B.Tech (AI & DS), 3rd Year

## Architecture & Hypervisor Note
AWS Free Tier instances (t3.micro) restrict nested hardware virtualization (VT-x / AMD-V) required by local Type-2 hypervisors such as VirtualBox. Instead, this practical leverages AWS's underlying **Nitro Hypervisor** (Type-1 cloud hypervisor) to run the VM directly in the cloud, paired with the lightweight **XFCE4** desktop environment and **xrdp** server so the graphical OS runs smoothly within 1 GiB of RAM.

## Instance Specifications
- Instance Name: Ubuntu-Desktop-pro
- Hypervisor: AWS Nitro Hypervisor (EC2)
- Operating System: Ubuntu Server 24.04 LTS (64-bit x86)
- Instance Type: t3.micro (2 vCPUs, 1 GiB RAM)
- Storage: 30 GiB gp3 EBS Root Volume
- Inbound Security Rules: SSH (TCP 22), RDP (TCP 3389)

## Technologies
- AWS EC2 & AWS Nitro Hypervisor
- Ubuntu Server 24.04 LTS
- XFCE4 Desktop Environment
- xrdp Server & Windows Remote Desktop (mstsc)
- AWS Security Groups & EC2 Instance Connect

## Repository Structure
```text
src/setup_desktop.sh
docs/architecture.md
screenshots/README.md
README.md
LICENSE



