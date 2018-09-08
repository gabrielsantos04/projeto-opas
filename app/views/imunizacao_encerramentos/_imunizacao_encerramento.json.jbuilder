json.extract! imunizacao_encerramento, :id, :imunizacao_esquema_id, :data_administracao, :lote, :validade, :laboratorio, :unidade_administracao, :via_administracao, :profissional, :observacoes, :created_at, :updated_at
json.url imunizacao_encerramento_url(imunizacao_encerramento, format: :json)
