json.extract! contato_avaliacao, :id, :data, :suspeito, :confirmado, :notificacao_contato_id, :created_at, :updated_at
json.url contato_avaliacao_url(contato_avaliacao, format: :json)
