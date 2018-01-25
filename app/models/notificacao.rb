# == Schema Information
#
# Table name: notificacaos
#
#  id                  :integer          not null, primary key
#  numero              :string
#  data                :date
#  grau_incapacidade   :string
#  modo_entrada        :string
#  modo_deteccao       :string
#  observacoes         :string
#  baciloscopia        :string
#  data_inicio         :date
#  esquema_terapeutico :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  paciente_id         :integer
#
# Indexes
#
#  index_notificacaos_on_paciente_id  (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (paciente_id => pacientes.id)
#

class Notificacao < ApplicationRecord
  belongs_to :paciente

  has_many :dados_clinicos
  has_many :notificacao_contatoes
  has_many :avaliacao_notificacaos
  has_many :esquema_substitutivos
  has_many :episodio_reacionals
  has_many :avaliacao_sensitivas

  accepts_nested_attributes_for :dados_clinicos, allow_destroy: true
  accepts_nested_attributes_for :notificacao_contatoes, allow_destroy: true
  accepts_nested_attributes_for :avaliacao_notificacaos, allow_destroy: true
  accepts_nested_attributes_for :esquema_substitutivos, allow_destroy: true
  accepts_nested_attributes_for :episodio_reacionals, allow_destroy: true
  accepts_nested_attributes_for :avaliacao_sensitivas, allow_destroy: true

  extend Enumerize

  enumerize :grau_incapacidade, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicate: true
  enumerize :modo_entrada, in: [:caso_novo, :outra_unidade,:outro_municipio,:outro_estado,:outro_pais,:recidiva,:outros_reingressos], predicate: true
  enumerize :modo_deteccao, in: [:encaminhamento, :demanda_expontanea,:exame_coletividade,:exame_contatos,:outros_modos], predicate: true
  enumerize :baciloscopia, in: [:positivo, :negativo,:nao_realizado], predicate: true
  enumerize :esquema_terapeutico, in: [:pb_infantil, :pb_adulto,:mb_infantil,:mb_adulto,:outros_esquemas], predicate: true

  def to_s
    self.numero
  end
end
