Rails.application.routes.draw do


  devise_for :users
  resources :users do
    collection do
      get "home"
    end
  end
  resources :condutas
  resources :diagnosticos
  resources :sinais_sintomas
  resources :dermatologicas
  resources :recidivas
  resources :categoria_queixas
  resources :avaliacao_sensitivas do
    member do
      get "inserir_marcacao"
    end
    collection do
      get "remover_marcacao"
    end
  end
  resources :episodio_reacionals
  resources :avaliacao_neurologicas
  resources :classificacao_graus
  resources :avaliacao_notificacaos
  resources :esquema_substitutivos
  resources :contato_avaliacaos
  resources :bcgs
  resources :notificacao_contatos
  resources :dados_clinicos
  resources :notificacaos do
    collection do
      get 'home'
      get 'avaliacao_pendente'
    end
    member do
      get "recidiva"
    end
  end
  resources :pacientes do
    collection do
      get "mapa"
    end
  end
  resources :medicamentos
  resources :queixas
  resources :monofilamentos
  resources :ocupacaos
  resources :cidades

  resources :escala_parts
  resources :escala_salsas
  resources :monthly_reports

  scope "/dant" do
    resources :dant_questions
    resources :dant_requests do
      member do
        get "enviar"
        get "faixa_etaria"
        get "alterar_status"
      end
    end
    resources :dant_responsavel_programs
    resources :dant_regions
    resources :dant_pacients


  end

  scope "/imunizacao" do
    resources :imunizacao_encerramentos
    resources :imunizacao_esquemas do
      member do
        get "novo_encerramento"
        get "nao_aplicado"
      end
    end
    resources :imunizacao_imunobiologicos do
      member do
        get "nova_dose"
        get "indeferir"
      end
    end
    resources :imunizacao_vacinas
    resources :imunizacao_solicitacaos
  end

  scope  "/dst" do
    resources :dst_questionarios
    resources :dst_movimentacaos do
      collection do
        get "atender"
        get "finalizar_atendimento"
      end
    end
    resources :dst_solicitacao_produtos
    resources :dst_solicitacaos
    resources :dst_lotes
    resources :dst_locals
    resources :dst_produtos do
      member do
        get "lotes_ajax"
      end
    end
  end

  root "users#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
