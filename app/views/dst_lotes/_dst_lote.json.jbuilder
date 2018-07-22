json.extract! dst_lote, :id, :dst_produto_id, :nome, :descricao, :validade, :created_at, :updated_at
json.url dst_lote_url(dst_lote, format: :json)
