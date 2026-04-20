variable "prefix" {
  description = "Prefix used for all resource names"
  type        = string
  default     = "openclaw"
}

variable "location" {
  description = "Azure region to deploy into"
  type        = string
  default     = "westeurope"
  # Other good options: westeurope, southafricanorth (closest to Lagos)
}

variable "environment" {
  description = "Environment label for tagging"
  type        = string
  default     = "production"
}

variable "vm_size" {
  description = <<-EOT
    Azure VM size. Minimum recommendation: Standard_B2s (2 vCPU, 4 GB RAM).
    Upgrade to Standard_D2s_v3 or Standard_D4s_v3 if you want more headroom.
    DO NOT use Standard_B1s (1 GB RAM) — OpenClaw will fail to install.
  EOT
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Non-root Linux user created on the VM"
  type        = string
  default     = "openclaw"
}

variable "ssh_port" {
  description = "Non-standard SSH port. Port 22 is never opened."
  type        = number
  default     = 2222
}

variable "allowed_ssh_cidr" {
  description = <<-EOT
    Your home/office IP in CIDR notation (e.g. "197.x.x.x/32").
    Use "0.0.0.0/0" only temporarily during initial setup if your IP is dynamic.
    Once Tailscale is confirmed, this rule is removed entirely.
  EOT
  type        = string
  # No default — you must provide this. Get your IP: curl ifconfig.me
}

variable "tailscale_authkey" {
  description = <<-EOT
    Tailscale one-time auth key (reusable keys also work).
    Generate at: https://login.tailscale.com/admin/settings/keys
    Mark as ephemeral if you want the node removed from Tailscale when VM is destroyed.
    Keep this secret — pass via TF_VAR_tailscale_authkey env var or terraform.tfvars.
  EOT
  type      = string
  sensitive = true
}

variable "openclaw_version" {
  description = "OpenClaw Docker image tag to deploy"
  type        = string
  default     = "latest"
}
