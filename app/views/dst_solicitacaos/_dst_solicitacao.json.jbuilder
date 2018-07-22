json.extract! dst_solicitacao, :id, :dst_local_id, :observacoes, :user_id, :status, :created_at, :updated_at
json.url dst_solicitacao_url(dst_solicitacao, format: :json)
