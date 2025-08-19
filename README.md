# Terraform Infrastructure Project

このプロジェクトは、AWSでVPC、Subnet、EC2インスタンスを管理するTerraformプロジェクトです。

## 🏗️ アーキテクチャ

- **VPC**: プライベートネットワーク環境
- **Subnet**: パブリック・プライベートサブネット
- **EC2**: Amazon Linux 2インスタンス
- **Security Group**: SSH アクセス用セキュリティグループ

## 📁 プロジェクト構成

```
terraform-infrastructure/
├── environments/
│   ├── dev/                    # 開発環境
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── versions.tf
│   └── prod/                   # 本番環境
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── versions.tf
├── modules/
│   ├── vpc/                    # VPCモジュール
│   ├── subnet/                 # Subnetモジュール
│   └── ec2/                    # EC2モジュール
└── README.md
```

## 🚀 使用方法

### 前提条件

- Terraform >= 1.10.0
- AWS CLI設定済み
- 適切なAWS権限

### dev環境のデプロイ

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

### prod環境のデプロイ

```bash
cd environments/prod
terraform init
terraform plan
terraform apply
```

### リソースの削除

```bash
# dev環境
cd environments/dev
terraform destroy

# prod環境
cd environments/prod
terraform destroy
```

## 🔒 バックエンド設定

- **S3バケット**: `handson-remote-backend-250818`
- **ステートファイル**: 環境ごとに分離
- **ロック機能**: Terraform 1.10.0のuse_lockfile機能を使用

## 📋 環境設定

### dev環境
- VPC CIDR: `10.0.0.0/16`
- インスタンスタイプ: `t3.micro`

### prod環境
- VPC CIDR: `10.1.0.0/16`
- インスタンスタイプ: `t3.small`

## 🛡️ セキュリティ

- 全リソースにEnvironmentタグを付与
- S3バケットはパブリックアクセスブロック設定済み
- セキュリティグループでSSHアクセスを制限

## 📝 注意事項

- `terraform.tfvars`ファイルは機密情報を含む可能性があるため、`.gitignore`で除外されています
- 実際の本番環境では、より厳密なセキュリティ設定を検討してください
- 使用後はコスト削減のため、不要なリソースを削除してください

## 🤝 コントリビューション

1. このリポジトリをフォーク
2. 機能ブランチを作成 (`git checkout -b feature/new-feature`)
3. 変更をコミット (`git commit -am 'Add new feature'`)
4. ブランチにプッシュ (`git push origin feature/new-feature`)
5. プルリクエストを作成

## 📄 ライセンス

MIT License
