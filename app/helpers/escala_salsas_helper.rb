#Disponibiliza métodos para serem usados nas views
module EscalaSalsasHelper

  #Retorna a legenda para o escore_salsa
  def escore_salsa_text(valor)
    case valor
      when 10..24
        "SM"
      when 25..39
        "LL"
      when 40..49
        "ML"
      when 50..59
        "SL"
      when 60..80
        "MSL"
      else
        ""
    end
  end

  #Retorna a resposta em texto
  def resposta_text(valor)
    case valor
      when 1
        "Fácil"
      when 2
        "Um pouco difícil"
      when 3
        "Muito difícil"
      when 0
        "Eu não preciso fazer isso"
      when 4
        "Eu fisicamente não consigo"
      when 5
        "Eu evito por causa do risco"
      else
        ""
    end
  end
end
