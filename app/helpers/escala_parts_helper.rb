module EscalaPartsHelper

  def irrelevante(valor)
    case valor
      when 1
        "Não é problema"
      when 2
        "Pequeno"
      when 3
        "Médio"
      when 5
        "Grande"
      else
        ""
    end
  end

  def grau(valor)
    case valor
      when "sem_restricao_significativa"
        "Sem restrição significativa"
      when "leve_restricao"
        "Leve Restrição"
      when "restricao_moderada"
        "Restrição Moderada"
      when "restricao_grave"
        "Restrição Grave"
      when "restricao_extrema"
        "Restrição Extrema"
      else
        ""
    end
  end
end
