# == Schema Information
#
# Table name: recidivas
#
#  id                             :integer          not null, primary key
#  unidade_saude                  :string
#  prontuario                     :string
#  data_diagnostico               :date
#  classificacao_operacional      :string
#  forma_clinica                  :string
#  baciloscopia                   :string
#  baciloscopia_lb                :string
#  grau_incapacidade              :string
#  inicio_tratamento              :date
#  esquema_terapeutico            :string
#  tempo_tratamento               :integer
#  doses                          :integer
#  regularidade                   :boolean
#  tratamento_observacoes         :string
#  tempo_alta_cura                :integer
#  data_primeiros_sintomas        :date
#  baciloscopia_alta              :string
#  baciloscopia_lb_alta           :string
#  grau_incapacidade_alta         :string
#  classificacao_operacional_alta :string
#  notificacao_id                 :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  termino_tratamento             :date
#
# Indexes
#
#  index_recidivas_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

class Recidiva < ApplicationRecord
  belongs_to :notificacao
  has_many :diagnostico_recidivas
  has_many :epidosios_reacionais_recidivas
  has_many :sintomas_recidivas
  has_many :conduta_recidivas

  has_many :nervos_recidivas
  has_many :dermatologico_recidivas

  has_many :nervos_recidivas_alta, class_name: "NervosRecidiva"
  has_many :dermatologico_recidivas_alta, class_name: "DermatologicoRecidiva"

  accepts_nested_attributes_for :diagnostico_recidivas, allow_destroy: true
  accepts_nested_attributes_for :epidosios_reacionais_recidivas, allow_destroy: true
  accepts_nested_attributes_for :dermatologico_recidivas, allow_destroy: true
  accepts_nested_attributes_for :sintomas_recidivas, allow_destroy: true
  accepts_nested_attributes_for :nervos_recidivas, allow_destroy: true
  accepts_nested_attributes_for :conduta_recidivas, allow_destroy: true

  accepts_nested_attributes_for :nervos_recidivas_alta, allow_destroy: true
  accepts_nested_attributes_for :dermatologico_recidivas_alta, allow_destroy: true

  extend Enumerize
  enumerize :grau_incapacidade, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicate: true
  enumerize :grau_incapacidade_alta, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicate: true
  enumerize :baciloscopia, in: [:positivo, :negativo,:nao_realizado], predicate: true
  enumerize :esquema_terapeutico, in: [:pb_infantil, :pb_adulto,:mb_infantil,:mb_adulto,:outros_esquemas], predicate: true
  enumerize :baciloscopia_alta, in: [:positivo, :negativo,:nao_realizado], predicate: true


end
