# == Schema Information
#
# Table name: avaliacao_notificacaos
#
#  id                        :integer          not null, primary key
#  classificacao_operacional :string
#  inicio_pqt                :date
#  alta_pqt                  :date
#  profissao                 :string
#  unidade_saude             :string
#  atividades_realizadas_ubs :boolean
#  grupo_autocuidado         :boolean
#  encaminhamentos           :string
#  imobilizacoes             :string
#  adaptacoes                :string
#  observacoes               :string
#  notificacao_id            :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  atividades_orientadas     :boolean
#  paciente_id               :integer
#  inicial                   :boolean
#
# Indexes
#
#  index_avaliacao_notificacaos_on_notificacao_id  (notificacao_id)
#  index_avaliacao_notificacaos_on_paciente_id     (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#

class AvaliacaoNotificacao < ApplicationRecord
  belongs_to :notificacao, optional: true
  belongs_to :paciente

  has_many :avaliacao_neurologicas
  has_many :classificacao_graus
  has_many :avaliacao_sensitivas



  accepts_nested_attributes_for :avaliacao_neurologicas, allow_destroy: true
  accepts_nested_attributes_for :classificacao_graus, allow_destroy: true
  accepts_nested_attributes_for :avaliacao_sensitivas, allow_destroy: true

  validates :classificacao_operacional,:inicio_pqt,:unidade_saude,:profissao, presence: true

  extend Enumerize

  enumerize :classificacao_operacional, in: [:multibacilar, :paucibacilar], predicates: true
end
