json.extract! dant_pacient, :id, :nome, :sexo, :endereco, :rg, :cpf, :idade, :frascos_diarios, :frascos_mensais, :tipo_insulina, :hipertenso, :diabetico, :tabagista, :etilista, :obeso, :grau_obesidade, :cidade_id, :created_at, :updated_at
json.url dant_pacient_url(dant_pacient, format: :json)
