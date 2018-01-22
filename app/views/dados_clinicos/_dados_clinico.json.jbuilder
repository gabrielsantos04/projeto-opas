json.extract! dados_clinico, :id, :lesoes_cultaneas, :forma_clinica, :classificacao_operacional, :nervos_afetados, :notificacao_id, :created_at, :updated_at
json.url dados_clinico_url(dados_clinico, format: :json)
