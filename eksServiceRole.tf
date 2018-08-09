resource "aws_iam_role" "eksServicerole" {
  name = "eksServicerole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "eksServicerole-AmazonEKSClusterPolicy" {
  name       = "eks-attachment"
  roles      = ["${aws_iam_user.eksServicerole.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_policy_attachment" "eksServicerole-AmazonEKSWorkerNodePolicy" {
  name       = "eks-attachment"
  roles      = ["${aws_iam_user.eksServicerole.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_policy_attachment" "eksServicerole-AdministratorAccess" {
  name       = "eks-attachment"
  roles      = ["${aws_iam_user.eksServicerole.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_policy_attachment" "eksServicerole-AmazonEKSServicePolicy" {
  name       = "eks-attachment"
  roles      = ["${aws_iam_user.eksServicerole.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_policy_attachment" "eksServicerole-AmazonEKS_CNI_Policy" {
  name       = "eks-attachment"
  roles      = ["${aws_iam_user.eksServicerole.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
