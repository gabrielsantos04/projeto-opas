# == Schema Information
#
# Table name: recidivas
#
#  id                                 :integer          not null, primary key
#  unidade_saude                      :string
#  prontuario                         :string
#  data_diagnostico                   :date
#  classificacao_operacional          :string
#  forma_clinica                      :string
#  baciloscopia                       :string
#  baciloscopia_lb                    :string
#  grau_incapacidade                  :string
#  inicio_tratamento                  :date
#  esquema_terapeutico                :string
#  tempo_tratamento                   :integer
#  doses                              :integer
#  regularidade                       :boolean
#  tratamento_observacoes             :string
#  tempo_alta_cura                    :integer
#  data_primeiros_sintomas            :date
#  grau_incapacidade_alta             :string
#  classificacao_operacional_alta     :string
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  termino_tratamento                 :date
#  forma_clinica_alta                 :string
#  baciloscopia_suspeita              :string
#  baciloscopia_lb_suspeita           :string
#  grau_incapacidade_suspeita         :string
#  classificacao_operacional_suspeita :string
#  forma_clinica_suspeita             :string
#  paciente_id                        :integer
#
# Indexes
#
#  index_recidivas_on_paciente_id  (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (paciente_id => pacientes.id)
#

class Recidiva < ApplicationRecord

  belongs_to :paciente
  has_one :notificacao

  has_many :diagnostico_recidivas, dependent: :destroy

  has_many :sintomas_recidivas, dependent: :destroy
  has_many :conduta_recidivas, dependent: :destroy

  has_many :epidosios_reacionais_recidivas, -> {where momento: :historia_anterior}, class_name: "EpidosiosReacionaisRecidiva", foreign_key: :recidiva_id, dependent: :destroy
  has_many :nervos_recidivas, -> {where momento: :historia_anterior}, class_name: "NervosRecidiva", foreign_key: :recidiva_id, dependent: :destroy
  has_many :dermatologico_recidivas, -> {where momento: :historia_anterior}, class_name: "DermatologicoRecidiva", foreign_key: :recidiva_id, dependent: :destroy


  has_many :epidosios_reacionais_recidivas_alta, -> {where momento: :alta_cura}, class_name: "EpidosiosReacionaisRecidiva", foreign_key: :recidiva_id, dependent: :destroy
  has_many :nervos_recidivas_alta, -> {where momento: :alta_cura}, class_name: "NervosRecidiva", foreign_key: :recidiva_id, dependent: :destroy
  has_many :dermatologico_recidivas_alta, -> {where momento: :alta_cura}, class_name: "DermatologicoRecidiva", foreign_key: :recidiva_id, dependent: :destroy

  has_many :nervos_recidivas_recidiva, -> {where momento: :suspeita_recidiva}, class_name: "NervosRecidiva", foreign_key: :recidiva_id, dependent: :destroy
  has_many :dermatologico_recidivas_recidiva, -> {where momento: :suspeita_recidiva}, class_name: "DermatologicoRecidiva", foreign_key: :recidiva_id, dependent: :destroy

  accepts_nested_attributes_for :diagnostico_recidivas, allow_destroy: true
  accepts_nested_attributes_for :epidosios_reacionais_recidivas, allow_destroy: true
  accepts_nested_attributes_for :dermatologico_recidivas, allow_destroy: true
  accepts_nested_attributes_for :sintomas_recidivas, allow_destroy: true
  accepts_nested_attributes_for :nervos_recidivas, allow_destroy: true
  accepts_nested_attributes_for :conduta_recidivas, allow_destroy: true

  accepts_nested_attributes_for :nervos_recidivas_alta, allow_destroy: true
  accepts_nested_attributes_for :dermatologico_recidivas_alta, allow_destroy: true
  accepts_nested_attributes_for :epidosios_reacionais_recidivas_alta, allow_destroy: true

  accepts_nested_attributes_for :nervos_recidivas_recidiva, allow_destroy: true
  accepts_nested_attributes_for :dermatologico_recidivas_recidiva, allow_destroy: true

  extend Enumerize
  enumerize :grau_incapacidade, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicates: true
  enumerize :grau_incapacidade_alta, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicates: true
  enumerize :grau_incapacidade_suspeita, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicates: true
  enumerize :baciloscopia, in: [:positivo, :negativo,:nao_realizado], predicates: true
  enumerize :esquema_terapeutico, in: [:pb_infantil, :pb_adulto,:mb_infantil,:mb_adulto,:outros_esquemas], predicates: true
  enumerize :baciloscopia_suspeita, in: [:positivo, :negativo,:nao_realizado], predicates: true
  enumerize :classificacao_operacional, in: [:multibacilar, :paucibacilar], predicates: true
  enumerize :forma_clinica, in: [:i, :t,:d,:v], predicates: true
  enumerize :forma_clinica_suspeita, in: [:i, :t,:d,:v], predicates: true
  enumerize :forma_clinica_alta, in: [:i, :t,:d,:v], predicates: true
  enumerize :classificacao_operacional_alta, in: [:multibacilar, :paucibacilar], predicates: true
  enumerize :classificacao_operacional_suspeita, in: [:multibacilar, :paucibacilar], predicates: true


end
