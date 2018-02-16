class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.administrador?
      can :manage, :all
    else
      can :create, Paciente
      can :manage, Paciente do |p|
        p.cidade == user.cidade
      end

      can [:create,:recidiva], Notificacao
      can [:index,:show,:edit,:update,:destroy], Notificacao do |p|
        p.paciente.cidade == user.cidade
      end

      can :create, AvaliacaoNotificacao
      can [:show,:edit,:update,:destroy], AvaliacaoNotificacao do |p|
        p.paciente.cidade == user.cidade
      end

      can :create, Recidiva
      can [:show,:edit,:update,:destroy], Recidiva do |p|
        p.paciente.cidade == user.cidade
      end

      can [:create,:inserir_marcacao,:remover_marcacao], AvaliacaoSensitiva
      can [:show,:edit,:update,:destroy], AvaliacaoSensitiva do |p|
        p.paciente.cidade == user.cidade
      end
    end

  end
end
