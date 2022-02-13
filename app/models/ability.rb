#Classe responsável por controlar as permissões dos usuários
class Ability
  include CanCan::Ability

  #Método que verifica as permissões
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.administrador?
      can :manage, :all
    elsif user.admin_hans?
      can :manage, AvaliacaoNeurologica
      can :manage, AvaliacaoNotificacao
      can :manage, AvaliacaoSensitiva
      can :manage, CategoriaQueixa
      can :manage, Cidade
      can :manage, ClassificacaoGrau
      can :manage, Conduta
      can :manage, CondutaRecidiva
      can :manage, ContatoAvaliacao
      can :manage, DadosClinico
      can :manage, Dermatologica
      can :manage, DermatologicoRecidiva
      can :manage, EpidosiosReacionaisRecidiva
      can :manage, EpisodioReacional
      can :manage, EscalaPart
      can :manage, EscalaSalsa
      can :manage, EsquemaSubstitutivo
      can :manage, Marcacao
      can :manage, Medicamento
      can :manage, Monofilamento
      can :manage, NervosRecidiva
      can :manage, Notificacao
      can :manage, NotificacaoContato
      can :manage, Ocupacao
      can :manage, Paciente
      can :manage, Queixa
      can :manage, Recidiva
      can :manage, SensitivaImage
      can :manage, SinaisSintoma
      can :manage, SintomasRecidiva
      can :manage, User
      can :manage, Diagnostico
    elsif user.municipio_hans? || user.municipio?
      can [:home, :avaliacao_pendente], Notificacao
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
      can :manage, DstMovimentacao
      can :manage, DstSolicitacao
      can :manage, DstQuestionario
      can :manage, User
    elsif user.dst_produtos?
      can :manage, DstSolicitacaoProduto
      can :manage, DstProduto
      can :manage, DstLote
      can :manage, DstSolicitacaoProduto
      can :manage, DstSolicitacao
      can :manage, DstLocal
      can :manage, DstMovimentacao
    elsif user.admin_dant?
      can :manage, DantPacient
      can :manage, DantQuestion
      can :manage, DantResponsavelProgram
      can :manage, DantCidadeRegion
      can :manage, DantRegion
      can :manage, DantRequest
      can :manage, User
    elsif user.admin_imuni?
      can :manage, ImunizacaoEncerramento
      can :manage, ImunizacaoEsquema
      can :manage, ImunizacaoImunobiologico
      can :manage, ImunizacaoSolicitacao
      can :manage, ImunizacaoVacina
    elsif user.municipio_imuni?
      can :manage, ImunizacaoSolicitacao
      can :manage, ImunizacaoEncerramento
      can :manage, ImunizacaoEsquema
    elsif user.municipio_dst?
      #Permissões para Módulo DST
      can :read, DstLocal
      can :read, DstMovimentacao
      can :create, DstMovimentacao
      can :read, DstSolicitacao
      can :create, DstSolicitacao
    else
      can :create, Paciente
      can :manage, Paciente do |p|
        p.cidade == user.cidade
      end

      can :create, Recidiva
      can :manage, Recidiva

      can :show, :all
    end

    can :home, User
  end
end
