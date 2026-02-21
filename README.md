# Terraform — домашнє завдання 3

Тут лежить terraform конфіг який піднімає інфраструктуру в AWS + DNS через Cloudflare.

## Що створюється

- VPC з публічною підмережею в AWS
- 2 EC2 інстанси: `web_server` і `app`
- Security groups: web_server відкритий по 80/443 для всіх, app — порт 8080 тільки з web_server
- SSH доступ на обидва сервери
- Route53 hosted zone для субдомену (наприклад aws.yourdomain.com)
- A-записи для серверів (web.aws.domain.com, app.aws.domain.com)
- NS делегування з Cloudflare на Route53

## Як запустити

1. Поставте terraform: https://developer.hashicorp.com/terraform/install

2. Налаштуйте AWS CLI:
```
aws configure
```

3. Скопіюйте приклад змінних і заповніть своїми даними:
```
cp terraform.tfvars.example terraform.tfvars
```

4. Запустіть:
```
terraform init
terraform plan
terraform apply
```

## SSH

Якщо не вказувати `ssh_public_key_path` — terraform сам згенерує ключ. Щоб його дістати:
```
terraform output -raw ssh_private_key > key.pem
chmod 600 key.pem
ssh -i key.pem ubuntu@<ip>
```

## Видалити все

```
terraform destroy
```

## Backend

Використовується local backend, стейт зберігається в terraform.tfstate. Файл в гітігнорі, бо містить секрети.
