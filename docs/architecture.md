# Architecture Overview
- **Hypervisor:** AWS Nitro Hypervisor (Type-1 cloud hypervisor)
- **Instance:** AWS EC2 `t3.micro` (2 vCPUs, 1 GiB RAM, 30 GiB gp3 EBS)
- **OS & GUI:** Ubuntu Server 24.04 LTS with lightweight XFCE4 desktop
- **Connectivity:** Browser SSH (Port 22) and Windows RDP via `xrdp` (Port 3389)
