json.extract! imunizacao_vacina, :id, :nome, :descricao, :created_at, :updated_at
json.url imunizacao_vacina_url(imunizacao_vacina, format: :json)
