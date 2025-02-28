#!/bin/bash
# Audit IAM policies for overly permissive statements
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

echo "Auditing IAM policies in account $AWS_ACCOUNT_ID..."

# List all policies
aws iam list-policies --query "Policies[?Arn!='arn:aws:iam::aws:policy/*']" \
  --output text | while read POLICY; do
  POLICY_ARN=$(echo $POLICY | awk '{print $1}')
  echo "Checking policy: $POLICY_ARN"
  
  # Check for wildcard actions
  aws iam get-policy-version --policy-arn $POLICY_ARN --version-id v1 \
    | grep -E '"Action": \["\*"|"Action": "s3:\*"'
done
