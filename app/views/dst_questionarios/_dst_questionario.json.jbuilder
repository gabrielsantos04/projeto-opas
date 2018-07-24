json.extract! dst_questionario, :id, :titulo, :descricao, :ativo, :created_at, :updated_at
json.url dst_questionario_url(dst_questionario, format: :json)
