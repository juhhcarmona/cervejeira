# Cervejeira

Aplicação que retorna o melhor estilo de cerveja para ser tomada dada uma temperatura.

### Requerimentos:

* Ruby -v 2.1.10
* Rails -v 4.2.6
* Postgres

### Rodando localmente

* Faça o fork desse repositório
* Forke o [repositório da API](https://github.com/juhhcarmona/cervejeira_api) e siga os passos pra deixa-la rodando
* Entre no diretório `cervejeira/` e execute o comando `bundle install`
* Configure seu banco de dados no arquivo `config/database.yml` segundo suas configurações locais.
* Execute o comando `rake db:create`
* Execute o comando `rails s` para rodar o servidor local.
* Vá para a seguinte URL [http://localhost:3000/](http://localhost:3000/), a interface da aplicação deve aparecer pronta para uso


### Como rodar os testes

A primeira vez que rodar os testes rode com a [API](https://github.com/juhhcarmona/cervejeira_api) sendo executada, todos os requests para [API](https://github.com/juhhcarmona/cervejeira_api) serão mockados e serão usados nos testes futuros.

Para rodar os testes basta executar o comando `rspec` no terminal

