# API de Filmes

API REST para filmes

Request de cadastro: http://localhost:3000/api/v1/movies
Body: 
{
  "movie": {
      "name": "Interestelar",
      "summary": "Exploracao espacial e buracos de minhoca.",
      "year_release": 2014
  }
}

# 🔁 Etapas Futuras 
✅ Adicionar validações (ex: presença de nome e sinopse).

✅ Implementar tratamento de erro com status HTTP corretos.

✅ Usar serializers (ex: ActiveModel::Serializer, fast_jsonapi).

✅ Adicionar testes automatizados (com RSpec).

Autenticação simples via Token (JWT).

Paginação com kaminari ou pagy.

Permitir buscar filmes por nome (com filtro no index)

Adicionar relacionamento: Categoria ou Diretor

Criar um front-end com Vue ou React consumindo essa API
