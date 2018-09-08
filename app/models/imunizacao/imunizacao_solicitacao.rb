# == Schema Information
#
# Table name: imunizacao_solicitacaos
#
#  id                        :integer          not null, primary key
#  nome_paciente             :string
#  data_nascimento           :date
#  sexo                      :string
#  nome_mae                  :string
#  endereco                  :text
#  bairro                    :string
#  municipio_id              :integer
#  motivo_solicitacao        :text
#  nome_requisitante         :string
#  tipo_requisitante         :string
#  crm_coren                 :string
#  telefone_requisitante     :string
#  instituicao_requisitante  :string
#  municipio_requisitante_id :integer
#  anexo                     :text
#  solicitante               :string
#  observacoes               :text
#  data_atendimento          :date
#  municipio_atual_id        :integer
#  status                    :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  telefone_paciente         :string
#  idade                     :integer
#

class ImunizacaoSolicitacao < ApplicationRecord
  belongs_to :municipio, class_name: 'Cidade'
  belongs_to :municipio_requisitante, class_name: 'Cidade'
  belongs_to :municipio_atual, class_name: 'Cidade', optional: true
  has_many :imunobiologicos, -> { where tipo: 'fornecidas'  }, class_name: "ImunizacaoImunobiologico"
  has_many :outros_imunobiologicos, -> { where tipo: 'outros'  }, class_name: "ImunizacaoImunobiologico"

  extend Enumerize
  enumerize :sexo, in: [:masculino, :feminino], predicates: true
  enumerize :tipo_requisitante, in: [:medico, :enfermeiro], predicates: true
  enumerize :status, in: [:solicitado, :de_acordo, :em_desacordo, :dados_insuficientes], predicates: true, default: :solicitado

  accepts_nested_attributes_for :imunobiologicos, allow_destroy: true
  accepts_nested_attributes_for :outros_imunobiologicos, allow_destroy: true

  before_create :set_idade

  def set_idade
    self.idade = Date.today.year - self.data_nascimento.year
  end


end
