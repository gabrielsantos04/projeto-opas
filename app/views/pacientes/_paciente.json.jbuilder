json.extract! paciente, :id, :nome, :nome_mae, :idade, :peso, :endereco, :latitude, :longitude, :sexo, :telefone, :cidade_id, :ocupacao_id, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
