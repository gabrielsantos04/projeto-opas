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
#  deferimento               :text
#  anexos                    :json
#

class ImunizacaoSolicitacao < ApplicationRecord
  belongs_to :municipio, class_name: 'Cidade'
  belongs_to :municipio_requisitante, class_name: 'Cidade'
  belongs_to :municipio_atual, class_name: 'Cidade', optional: true
  has_many :imunobiologicos, -> { where tipo: 'fornecidas'  }, class_name: "ImunizacaoImunobiologico"
  has_many :outros_imunobiologicos, -> { where tipo: 'outros'  }, class_name: "ImunizacaoImunobiologico"
  has_many :imunizacao_files


  extend Enumerize
  enumerize :sexo, in: [:masculino, :feminino], predicates: true
  enumerize :tipo_requisitante, in: [:medico, :enfermeiro], predicates: true
  enumerize :status, in: [:solicitado, :autorizado, :nao_autorizado, :em_analise,:pendente], predicates: true, default: :solicitado

  accepts_nested_attributes_for :imunobiologicos, allow_destroy: true
  accepts_nested_attributes_for :outros_imunobiologicos, allow_destroy: true
  accepts_nested_attributes_for :imunizacao_files, allow_destroy: true


  before_create :set_idade
  before_save :remover_caracteres

  mount_uploaders :anexos, ImageUploader

  #Método que seta a idade do paciente
  def set_idade
    self.idade = Date.today.year - self.data_nascimento.year
  end

  #Método que remove os caractéres especiais e realiza o uppercase
  def remover_caracteres
    self.nome_paciente = I18n.transliterate(self.nome_paciente).upcase
    self.nome_mae = I18n.transliterate(self.nome_mae).upcase
    self.endereco = I18n.transliterate(self.endereco).upcase
    self.bairro = I18n.transliterate(self.bairro).upcase
    self.motivo_solicitacao = I18n.transliterate(self.motivo_solicitacao).upcase
    self.nome_requisitante = I18n.transliterate(self.nome_requisitante).upcase
    self.instituicao_requisitante = I18n.transliterate(self.instituicao_requisitante).upcase
    self.solicitante = I18n.transliterate(self.solicitante).upcase
    self.observacoes = I18n.transliterate(self.observacoes).upcase
    self.deferimento = I18n.transliterate(self.deferimento || "").upcase
  end


end
