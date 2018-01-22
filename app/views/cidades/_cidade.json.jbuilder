json.extract! cidade, :id, :nome, :uf, :latitude, :longitude, :created_at, :updated_at
json.url cidade_url(cidade, format: :json)
