Rails.application.routes.draw do
  resources :categoria_queixas
  resources :avaliacao_sensitivas
  resources :episodio_reacionals
  resources :avaliacao_neurologicas
  resources :classificacao_graus
  resources :avaliacao_notificacaos
  resources :esquema_substitutivos
  resources :contato_avaliacaos
  resources :bcgs
  resources :notificacao_contatos
  resources :dados_clinicos
  resources :notificacaos
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

  root "pacientes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
