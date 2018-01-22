json.extract! avaliacao_notificacao, :id, :classificacao_operacional, :inicio_pqt, :alta_pqt, :profissao, :unidade_saude, :atividades_realizadas_ubs, :grupo_autocuidado, :encaminhamentos, :imobilizacoes, :adaptacoes, :observacoes, :notificacao_id, :created_at, :updated_at
json.url avaliacao_notificacao_url(avaliacao_notificacao, format: :json)
