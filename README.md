# AWS IAM Policy Overhaul & Security Hardening  
🔒 **Hardened IAM policies, encrypted S3 buckets, and WAF rules to secure AWS infrastructure.**

## Overview  
This repository contains Terraform/IAM policies and security configurations to:  
- Remove overly permissive IAM roles.  
- Encrypt S3 buckets with KMS.  
- Restrict network traffic via Security Groups.  
- Block malicious requests using AWS WAF.  

## Features  
- **Least Privilege IAM Policies**: Restrict access to specific IP ranges and actions.  
- **KMS Encryption**: Automatically encrypt S3 buckets.  
- **Security Groups**: Allow only HTTPS/SSH from trusted IPs.  
- **WAF Rules**: Block SQL injection and malicious payloads.  

## Prerequisites  
- AWS CLI configured with credentials.  
- Terraform v1.0+.  

## Usage  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/abhishekpandey3057/aws-iam-security.git  
