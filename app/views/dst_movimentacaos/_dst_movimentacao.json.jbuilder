json.extract! dst_movimentacao, :id, :dst_produto_id, :tipo, :categoria, :quantidade, :dst_lote_id, :descricao, :dst_local_id, :dst_solicitacao_produto_id, :created_at, :updated_at
json.url dst_movimentacao_url(dst_movimentacao, format: :json)
