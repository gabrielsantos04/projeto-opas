json.extract! dst_solicitacao_produto, :id, :dst_produto_id, :quantidade, :status, :dst_solicitacao_id, :created_at, :updated_at
json.url dst_solicitacao_produto_url(dst_solicitacao_produto, format: :json)
