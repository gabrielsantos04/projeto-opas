#Classe responsável por controlar as permissões dos usuários
class Ability
  include CanCan::Ability

  #Método que verifica as permissões
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.administrador?
      can :manage, :all
    elsif user.municipio_hans? || user.municipio?
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
    elsif user.admin_dst?
      can :manage, DstLocal
      can :manage, DstSolicitacaoProduto
      can :manage, DstProduto
      can :manage, DstLote
    elsif user.dst_produtos?
      can :manage, DstProduto
      can :manage, DstLote
    elsif user.admin_dant?
      can :manage, DantPacient
      can :manage, DantQuestion
      can :manage, DantResponsavelProgram
      can :manage, DantCidadeRegion
      can :manage, DantRegion
      can :manage, DantRequest
    elsif user.admin_imuni?
      can :manage, ImunizacaoEncerramento
      can :manage, ImunizacaoEsquema
      can :manage, ImunizacaoImunobiologico
      can :manage, ImunizacaoSolicitacao
      can :manage, ImunizacaoVacina
    else
      can :create, Paciente
      can :manage, Paciente do |p|
        p.cidade == user.cidade
      end

      can :create, Recidiva
      can :manage, Recidiva

      can :show, :all
    end

    #Permissões para Módulo DST
    can :read, DstLocal
    can :read, DstMovimentacao
    can :create, DstMovimentacao
    can :read, DstSolicitacao
    can :create, DstSolicitacao

    can :home, User

  end
end
