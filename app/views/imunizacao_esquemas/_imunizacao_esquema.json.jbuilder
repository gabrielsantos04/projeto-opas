json.extract! imunizacao_esquema, :id, :imunizacao_imunobiologicos_id, :dose, :esquema, :status, :justificativa, :created_at, :updated_at
json.url imunizacao_esquema_url(imunizacao_esquema, format: :json)
