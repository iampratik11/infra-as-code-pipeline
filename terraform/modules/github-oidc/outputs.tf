output "github_actions_role_arn" {
  description = "IAM role ARN assumed by GitHub Actions"
  value       = aws_iam_role.github_actions.arn
}

output "github_actions_policy_json" {
  description = "Rendered GitHub Actions IAM policy"
  value       = data.aws_iam_policy_document.github_actions.json
}
