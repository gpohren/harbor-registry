# Harbor Registry

Criar um ambiente para servir o Harbor

## Ferramentas utilizadas

* **Amazon Web Services**
  * [Website](https://aws.amazon.com/free/free-tier/)
  * [Docs](https://docs.aws.amazon.com/)

* **Terraform**
  * [Website](https://www.terraform.io/)
  * [Docs](https://www.terraform.io/docs/index.html)

* **Ansible**
  * [Website](https://www.ansible.com/)
  * [Docs](https://docs.ansible.com/)

* **Docker**
  * [Website](https://www.docker.com/)
  * [Docs](https://docs.docker.com/)

* **Harbor**
  * [Website](https://goharbor.io/)
  * [Docs](https://goharbor.io/docs/2.5.0/)

# Como fazer o deploy

## Gerar um par de chaves

```
ssh-keygen -P "" -t rsa -b 2048 -f ~/harbor_key
```

## Terraform

Editar `variables.tf`

```
default = "../../keys/harbor_key.pub"
```

Criar instância EC2 na AWS

Inicializar Terraform

```bash
terraform init
```

Criar o plano

```bash
terraform plan
```

Aplicar as mudanças

```bash
terraform apply
```

Outputs gerados

```
instance_public_ip = "54.162.8.39"
```

## Registrar Zona DNS

| Nome | TTL | Classe | Tipo | Registro
| --- | --- | --- | --- | --- |
| registry.example.com | 3600 | IN | A | 54.162.8.39

## Ansible

Editar `ansible.cfg`

```
private_key_file=./keys/harbor_key
```

Editar `main.yml` dentro do `inventory`

```
hosts:
  54.162.8.39
```

Executar o playbook

```
ansible-playbook harbor-registry.yml
```

## Licença

Esse projeto está sob licença. Veja o arquivo [LICENÇA](LICENSE.md) para mais detalhes.

[Voltar ao topo](#harbor-registry)<br>
