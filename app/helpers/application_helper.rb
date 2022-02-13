#Disponibiliza métodos para serem usados nas views
module ApplicationHelper
  def meses_for_select
    [["Janeiro","janeiro"],["Fevereiro","fevereiro"],["Março","março"],["Abril","abril"],["Maio","maio"],
     ["Junho","junho"],["Julho","julho"],["Agosto","agosto"],["Setembro","setembro"],["Outubro","outubro"],
     ["Novembro","novembro"],["Dezembro","dezembro"]]
  end
end
