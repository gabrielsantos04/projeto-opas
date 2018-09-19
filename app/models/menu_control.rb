#Classe que controla o menu de acordo com o módulo
class MenuControl
  #Método que recupera o namespace do módulo
  def self.get_namespace(route)
    namespace = route.split("/")[1]
    if menu.include? namespace
      return namespace
    end
    'default'
  end

  #Método que seta os menus
  def self.menu
    ['dst','dant', 'imunizacao','usuario']
  end
end