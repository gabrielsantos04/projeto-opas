json.extract! notificacao, :id, :numero, :data, :grau_incapacidade, :modo_entrada, :modo_deteccao, :observacoes, :baciloscopia, :data_inicio, :esquema_terapeutico, :created_at, :updated_at
json.url notificacao_url(notificacao, format: :json)
