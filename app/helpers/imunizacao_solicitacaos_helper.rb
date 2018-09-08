#Disponibiliza métodos para serem usados nas views
module ImunizacaoSolicitacaosHelper

  #Retorna o status em formado de texto
  def status(op)
    case op
      when "solicitado"
        "Solicitado"
      when "de_acordo"
        "Está de acordo com os critérios do centro de referência para imunobiológicos especiais - CRIE"
      when "em_desacordo"
        "Não está de acordo com os critérios do centro de referência para imunobiológicos especiais - CRIE"
      when "dados_insuficientes"
        "Dados insuficientes (idade, contatos telefônicos, laudos de exames, etc)"

    end
  end
end
