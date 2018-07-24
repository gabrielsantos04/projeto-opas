class MenuControl
  def self.get_namespace(route)
    namespace = route.split("/")[1]
    if menu.include? namespace
      return namespace
    end
    'default'
  end

  def self.menu
    ['dst','dant']
  end
end