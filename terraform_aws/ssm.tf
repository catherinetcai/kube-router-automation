resource "aws_iam_role_policy_attachment" "ssm-control-plane-policy-attachment" {
  role       = aws_iam_role.control-plane-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ssm-worker-policy-attachment" {
  role       = aws_iam_role.worker-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
