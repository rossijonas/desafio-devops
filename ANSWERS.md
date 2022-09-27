# Tembici - Desafio DevOps - Respostas

## PREMISSAS ADOTADAS

- Foi criada uma Dockerfile para a aplicação Python fornecida.

- Foi criado um pipeline em Github Actions responsável por, a cada Merge ou Pull Request na `main` Branch:

  - Rodar os testes da aplicação Python.
  
  - Criar a imagem do Container usando a Dockerfile.
  
  - Fazer Upload da imagem criada ao Docker Hub.

- Foi criada IaC utilizando Terraform para provisionar a infraestrutura GCP para hospedar a aplicação.

------

## COMO REPRODUZIR O SERVIÇO

### Pré-Requisitos:

- Terraform

- Google Cloud CLI

### Instruções:

1. Criar um Fork deste repositório.

2. Dentro das configurações do repositório, criar um `environment` como o nome `Production` e adicionar seus respectivos dados de login do serviço Docker Hub: `DOCKER_USERNAME` e `DOCKER_PASSWORD`.

3. Editar a linha 53 do arquivo `.github/workflows/python-app-test.yml` substituindo o nome de usuário em `images: rossijonas/desafio-devops`.

4. Criar um Pull Request na `main` Branch para ativar o Pipeline.

5. Criar um novo projeto no seu ambiente GCP, criar chaves de acesso e configurar seu `gcloud` CLI com as chaves de acesso ao projeto.

6. No arquivo `base-test-api-infra/variables.tf` substituir os Defaults das variáveis `project` e `container_image` pelos respectivos dados referentes ao seu projeto e repositório.

7. Dentro do diretório `base-test-api-infra/` executar a IaC:

  - `terraform init`
  
  - `terraform plan`
  
  - `terraform apply`

**O Terraform vai emitir um Output com o endereço de IP do servidor em que a aplicação está rodando (porta 8080).** 

------

## CONSIDERAÇÕES FINAIS

O desafio foi uma tarefa interessante e um desafiadora uma vez que tive que lidar com algumas tecnologias que eu não tinha experiência anterior como:

  - O ecossistema para aplicações Pyhton (`pipenv`).
  
  - Infraestrutura no GCP.

Para solução do desafio foram utilizadas ferramentas e recursos simples (ex.: GCP - Compute Engine), não os mais simples (ex.: GCP - Cloud Run), porém simples a ponto de prejudicar um pouco o fluxo de escalabilidade (o ideal seria usar GCP - GKE).

A escolha foi realizada visando conseguir cumprir a base dos requisitos, dentro do prazo de tempo estabelecido.

Existem diversos pontos que podem ser melhorados na solução apresentada aqui, e gostaria de ter a chance de discutir mais com a área técnica da Tembici sobre estes pontos como:

  - Acelerar a criação do Container e reduzir seu tamanho utilizando imagens de base mais enxutas como: `python:3.6-slim`, `python:3.6-alpine`.

  - Utilizar ferramentas de CI mais robustas como Circle CI ou Jenkins.

  - Provisionar usando Terraform um repositório privado GCP - Artifact Registry para Hospedar a imagem do Container de forma privada.

  - Utilizar um GCS Bucket como Backend para o Terraform.

  - Provisionar usando Terraform um Kubernetes Cluster gerenciado (GCP - GKE) visando maior escalabilidade.

  - Utilizar ferramentas de Métricas e Observabilidade como Prometheus e Grafana. 

------

*🙌 Obrigado pela oportunidade! 🙌*

*Jonas Balieiro Rossi*

