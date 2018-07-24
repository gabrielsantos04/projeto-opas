json.extract! dst_produto, :id, :nome, :descricao, :unidade_medida, :created_at, :updated_at
json.url dst_produto_url(dst_produto, format: :json)
