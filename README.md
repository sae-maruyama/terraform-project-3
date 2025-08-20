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

## バックエンド設定

- **S3バケット**: `handson-remote-backend-250818`
- **tf.stateファイル**: 環境ごとに分離

## 注意事項
- `terraform.tfvars`ファイルは機密情報を含む可能性があるため、`.gitignore`で除外
