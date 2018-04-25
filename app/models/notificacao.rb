# == Schema Information
#
# Table name: notificacaos
#
#  id                       :integer          not null, primary key
#  numero                   :string
#  data                     :date
#  grau_incapacidade        :string
#  modo_entrada             :string
#  modo_deteccao            :string
#  observacoes              :string
#  baciloscopia             :string
#  data_inicio              :date
#  esquema_terapeutico      :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  paciente_id              :integer
#  recidiva_id              :integer
#  avaliacao_notificacao_id :integer
#
# Indexes
#
#  index_notificacaos_on_avaliacao_notificacao_id  (avaliacao_notificacao_id)
#  index_notificacaos_on_paciente_id               (paciente_id)
#  index_notificacaos_on_recidiva_id               (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_notificacao_id => avaliacao_notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#  fk_rails_...  (recidiva_id => recidivas.id)
#

class Notificacao < ApplicationRecord
  belongs_to :paciente
  belongs_to :recidiva, optional: true
  belongs_to :avaliacao_notificacao, optional: true

  has_many :dados_clinicos, dependent: :destroy
  has_many :notificacao_contatoes, dependent: :destroy
  has_many :avaliacao_notificacaos, dependent: :destroy
  has_many :esquema_substitutivos, dependent: :destroy
  has_many :episodio_reacionals, dependent: :destroy
  has_many :avaliacao_sensitivas
  has_many :recidivas

  accepts_nested_attributes_for :dados_clinicos, allow_destroy: true
  accepts_nested_attributes_for :notificacao_contatoes, allow_destroy: true
  accepts_nested_attributes_for :avaliacao_notificacaos, allow_destroy: true
  accepts_nested_attributes_for :esquema_substitutivos, allow_destroy: true
  accepts_nested_attributes_for :episodio_reacionals, allow_destroy: true
  accepts_nested_attributes_for :avaliacao_sensitivas, allow_destroy: true
  accepts_nested_attributes_for :recidivas, allow_destroy: true

  extend Enumerize

  enumerize :grau_incapacidade, in: [:grau_0, :grau_1,:grau_2,:nao_avaliado], predicates: true
  enumerize :modo_entrada, in: [:caso_novo, :outra_unidade,:outro_municipio,:outro_estado,:outro_pais,:recidiva,:outros_reingressos], predicates: true
  enumerize :modo_deteccao, in: [:encaminhamento, :demanda_expontanea,:exame_coletividade,:exame_contatos,:outros_modos], predicates: true
  enumerize :baciloscopia, in: [:positivo, :negativo,:nao_realizado], predicates: true
  enumerize :esquema_terapeutico, in: [:pb_infantil, :pb_adulto,:mb_infantil,:mb_adulto,:outros_esquemas], predicates: true

  validates_presence_of Notificacao.attribute_names - %w(id created_at updated_at observacoes recidiva_id avaliacao_notificacao_id)
  validates_presence_of :dados_clinicos,:notificacao_contatoes#,:avaliacao_notificacaos


  def to_s
    self.numero
  end
end
