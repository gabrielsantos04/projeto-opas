json.extract! user, :id, :nome, :cpf, :email, :cidade_id, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
