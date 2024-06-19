# Projeto de Infraestrutura com Terraform

Este projeto configura e provisiona a infraestrutura na AWS usando o Terraform. Ele inclui a criação de uma VPC, subnets públicas e privadas, instâncias EC2, um bucket S3 e outros recursos necessários.

## Estrutura do Projeto

A estrutura do projeto é organizada em diferentes arquivos `.tf` conforme a funcionalidade:

- `provider.tf`: Define o provedor AWS.
- `s3.tf`: Cria um bucket S3 com versionamento habilitado.
- `vpc.tf`: Configura a VPC principal.
- `public.tf`: Configura a subnet pública.
- `private.tf`: Configura a subnet privada.
- `igw.tf`: Cria um Internet Gateway.
- `rtb.tf`: Cria a tabela de rotas e associa à subnet pública.
- `sg.tf`: Cria o grupo de segurança para a instância EC2.
- `ec2.tf`: Provisiona a instância EC2 e um IP elástico.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado.
- Credenciais AWS configuradas corretamente (pode usar o `aws configure`).

## Configuração

### Provedor AWS

O provedor AWS está definido em `provider.tf`:

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

### Recursos

- **Bucket S3** (`s3.tf`): Cria um bucket S3 com versionamento habilitado.
- **VPC** (`vpc.tf`): Cria uma VPC com CIDR `10.0.0.0/16`.
- **Subnets** (`public.tf`, `private.tf`): Cria subnets públicas e privadas.
- **Internet Gateway** (`igw.tf`): Cria um gateway de internet.
- **Tabela de Rotas** (`rtb.tf`): Cria uma tabela de rotas e associa à subnet pública.
- **Grupos de Segurança** (`sg.tf`): Cria grupos de segurança para a instância EC2.
- **Instância EC2** (`ec2.tf`): Cria uma instância EC2 com um script de inicialização.

### User Data para Instância EC2

O script de inicialização (`user_data`) instala e configura o nginx:

```hcl
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo mkdir -p /var/www/html
              sudo chown -R ec2-user:ec2-user /var/www/html
              sudo chmod -R 775 /var/www/html
              sudo echo "<html><body><h1>João Felipe Mendes de Souza</h1></body></html>" > /var/www/html/index.html
              sudo systemctl restart nginx
              EOF
```

## Instruções de Uso

1. Clone o repositório:
   ```sh
   git clone <URL-do-repositorio>
   cd <nome-do-repositorio>
   ```

2. Inicialize o Terraform:
   ```sh
   terraform init
   ```

3. Valide a configuração:
   ```sh
   terraform validate
   ```

4. Planeje a infraestrutura:
   ```sh
   terraform plan
   ```

5. Aplique a configuração:
   ```sh
   terraform apply
   ```

6. Quando terminar, você pode destruir os recursos provisionados:
   ```sh
   terraform destroy
   ```