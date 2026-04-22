# OpenClaw AI Agent on Azure (Terraform + Docker + Tailscale)

This project is a cloud-deployed AI agent setup inspired by:

👉 https://blog.thecloudopscommunity.org/deploy-your-own-24-7-ai-agent-on-aws-ec2-with-docker-tailscale-the-secure-way-e8e3dadde6a4

- Microsoft Azure (VM provisioning)
- Terraform (Infrastructure as Code)

# The goal is to create a secure, 24/7 always-on AI agent environment that is fully reproducible and destroyable.

- What You’ll Have by the End
- A hardened Ubuntu server with non-standard SSH configuration
- Docker running OpenClaw in an isolated container
- Secure private access via Tailscale (no public ports exposed)
- A fully functional AI assistant accessible from your browser

---

# ⚙️ What Terraform provisions

- Resource Group
- Virtual Network (VNet)
- Subnet
- Public IP
- Network Security Group (SSH)
- Linux VM (Ubuntu 22.04)
- SSH key authentication

---

# 🚀 Prerequisites

- Terraform ≥ 1.5
- Azure CLI
- SSH key pair
- Anthropic API Key (for Claude Sonnet/Opus — recommended for best performance)
- OpenAI API Key (Optional, as a backup)
- Tailscale Account: Free tier is sufficient (this is how we’ll securely access our bot)

---

# 🧱 Deployment

cd terraform
terraform init
terraform plan
terraform apply

---

# 🔐 SSH into VM

ssh -i ~/.ssh/openclaw-azure azureuser@<PUBLIC_IP>

---

# 🐳 Manual Setup

## Docker
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

## Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up

## Run agent
docker run -d --name ai-agent -p 3000:3000 your-image

---

# 🧹 Destroy

terraform destroy

---

# 💡 Why this project

- IaC with Terraform
- Azure-native deployment
- Secure remote compute
- 24/7 AI agent hosting

---

# 🔮 Improvements

- cloud-init automation
- private VM + Tailscale-only access
- CI/CD pipeline
