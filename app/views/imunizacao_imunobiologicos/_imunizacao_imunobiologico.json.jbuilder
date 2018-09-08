json.extract! imunizacao_imunobiologico, :id, :tipo, :nome_vacina, :imunizacao_vacina_id, :imunizacao_solicitacao_id, :status, :justificativa_indeferimento, :created_at, :updated_at
json.url imunizacao_imunobiologico_url(imunizacao_imunobiologico, format: :json)
