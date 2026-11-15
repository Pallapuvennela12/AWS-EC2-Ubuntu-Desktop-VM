# AWS-EC2-Ubuntu-Desktop-VM
# Install a Hypervisor and Create a VM with a Heavyweight Operating System

A cloud virtualization practical using AWS EC2 to provision an Ubuntu 24.04 LTS virtual machine on the AWS Nitro Hypervisor, configure a lightweight XFCE4 graphical desktop environment, and connect remotely from Windows via Remote Desktop Protocol (RDP).

## Objective
Provision a virtual machine running a heavyweight Linux operating system (Ubuntu 24.04 LTS) on AWS EC2 Free Tier (t3.micro), configure the XFCE4 desktop environment with xrdp, establish remote GUI access on TCP Port 3389, and verify the allocated virtual hardware resources.

## Presenter Details
- **Name:** Vennela Pallapu
- **Roll No:** 2410080070
- **Department:** B.Tech (AI & DS), 3rd Year
  
## video Demonstration:
 https://www.youtube.com/watch?v=PjVVQ97YOvA

## Verification Commands & Expected Outputs
1.Service & Port Check: sudo systemctl is-active xrdp xrdp-sesman && sudo ss -tulpn | grep 3389

Expected: Both services active; xrdp listening on *:3389

2.CPU Allocation: lscpu | grep "Model name\|CPU(s):"

Expected: 2 virtual CPU cores (Intel Xeon)

3.Memory Allocation: free -h

Expected: ~1.0 GiB total RAM (t3.micro)

4.Root Storage: df -h /

Expected: ~29 GB usable capacity mounted on /

5.OS Version: lsb_release -a

Expected: Ubuntu 24.04 LTS

## Deploy & Connect Using AWS Console
1.Open EC2 in the AWS Management Console and choose Launch instance.

2.Name the instance Ubuntu-Desktop-pro and select the Ubuntu Server 24.04 LTS AMI.

3.Choose the t3.micro instance type (Free Tier eligible).

4.Create or select a key pair and configure the Security Group to allow SSH (Port 22) and RDP (Port 3389).

5.Set root storage to 30 GiB (gp3) and launch the instance.

6.Connect to the instance via EC2 Instance Connect (browser SSH).

7.Run the setup commands in src/setup_desktop.sh and set the login password using sudo passwd ubuntu.

8.Open Remote Desktop Connection (mstsc) on Windows and enter the instance's Public IPv4 address.

9.Keep Session set to Xorg, log in with username ubuntu and your password, and verify the hardware specs in the terminal.

10.Terminate the EC2 instance after verification to stay within AWS Free Tier limits.

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

## Results
All deployment and verification steps were completed successfully:

-**VM Provisioning:** Ubuntu 24.04 LTS running on AWS EC2 t3.micro (2 vCPUs, 1 GiB RAM, 30 GiB EBS).

-**Remote Connectivity:** Active xrdp listener on TCP Port 3389 with encrypted Windows RDP access.

-**Graphical Desktop:** Responsive XFCE4 desktop interface without session crashes.

-**Hardware Verification:** Confirmed Intel Xeon vCPUs, memory, disk space, and Ubuntu 24.04 LTS release inside the VM terminal.

## Repository Structure
```text
src/setup_desktop.sh
docs/architecture.md
screenshots/README.md
README.md




