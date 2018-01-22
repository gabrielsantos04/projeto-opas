json.extract! notificacao_contato, :id, :nome, :tipo_contato, :suspeito, :confirmado, :notificacao_id, :created_at, :updated_at
json.url notificacao_contato_url(notificacao_contato, format: :json)
