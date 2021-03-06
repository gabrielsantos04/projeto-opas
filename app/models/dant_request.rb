# == Schema Information
#
# Table name: dant_requests
#
#  id                                 :integer          not null, primary key
#  qtd_hipertensos                    :integer
#  atendimento_hipertensos            :integer
#  qtd_obitos_hipertensos             :integer
#  qtd_diabeticos                     :integer
#  atendimento_diabeticos             :integer
#  qtd_obitos_diabeticos              :integer
#  qtd_diabeticos_hipertencos         :integer
#  atendimento_diabeticos_hipertensos :integer
#  qtd_tratamento_hemodialise         :integer
#  qtd_nph                            :integer
#  qtd_frascos_nph                    :integer
#  qtd_regular                        :integer
#  qtd_frascos_regular                :integer
#  qtd_analoga                        :integer
#  qtd_frascos_analoga                :integer
#  qtd_tabagista                      :integer
#  qtd_atendimento_tabagista          :integer
#  qtd_etilista                       :integer
#  qtd_atendimento_etilista           :integer
#  qtd_obesos                         :integer
#  qtd_obesidade_1                    :integer
#  qtd_obesidate_2                    :integer
#  qtd_obesidade_3                    :integer
#  mes                                :integer
#  dant_responsavel_program_id        :integer
#  cidade_id                          :integer
#  status                             :string
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  ano                                :integer
#  soma_participacoes                 :integer
#  data_envio                         :datetime
#  qtd_nph_calculada                  :integer
#  qtd_regular_calculada              :integer
#  qtd_analoga_calculada              :integer
#  justificativa                      :text
#  qtd_nph_caneta                     :integer
#  qtd_frascos_nph_caneta             :integer
#  qtd_regular_caneta                 :integer
#  qtd_frascos_regular_caneta         :integer
#
# Indexes
#
#  index_dant_requests_on_cidade_id                    (cidade_id)
#  index_dant_requests_on_dant_responsavel_program_id  (dant_responsavel_program_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (dant_responsavel_program_id => dant_responsavel_programs.id)
#

class DantRequest < ApplicationRecord
  belongs_to :dant_responsavel_program
  belongs_to :cidade, dependent: :destroy
  has_many :dant_request_pacients, dependent: :destroy
  has_many :dant_pacients, through: :dant_request_pacients
  has_many :dant_faixa_etarias, class_name: "DantFaixaEtarium"
  has_one :dant_region, through: :cidade

  accepts_nested_attributes_for :dant_request_pacients, allow_destroy: true
  accepts_nested_attributes_for :dant_faixa_etarias, allow_destroy: true

  extend Enumerize

  enumerize :status, in: [:cadastrada,:solicitado, :deferido,:indeferido,:entregue], predicates: true

  validate :total_obesos
  validates :mes,:dant_responsavel_program_id, :cidade_id, presence: true

  before_create :set_status
  after_create :set_pacientes

  #M??todo que verifica se o total dos ovesos por graus est?? igual a tabela de faixa et??ria
  def total_obesos
    errors.add(:base, "Verifique os quantitativos de Graus de Obesidade. Total dos Graus: #{self.qtd_obesidade_1 + self.qtd_obesidate_2 + self.qtd_obesidade_3}. Valor esperado: #{self.qtd_obesos}") if (self.qtd_obesidade_1 + self.qtd_obesidate_2 + self.qtd_obesidade_3) != self.qtd_obesos
  end

  def set_pacientes
    pacientes = DantPacient.where(cidade_id: self.cidade_id).where.not(obito: true)
    pacientes.each do |p|
      pac = DantRequestPacient.new(dant_request_id: self.id,dant_pacient_id:p.id, idade: p.idade, hipertenso: p.hipertenso, diabetico: p.diabetico,sexo: p.sexo_value)
      pac.save
    end
  end


  #M??todo que seta o status da solicita????o
  def set_status
    self.status = :cadastrada
    if self.mes == 12
      if DateTime.now.month <= 2
        self.ano = Date.today.year - 1
      elsif Date.today.month == 12
        self.ano = Date.today.year
      end

    else
      self.ano = Date.today.year
    end
  end

  #M??todo que calcula a quantidade de frascos a serem fornecidos
  def calcular_quantidades
    if self.mes == 3#mar??o
      if self.data_envio.month <= 3
        self.qtd_nph_calculada = self.qtd_frascos_nph * 3 #quantidade para 3 meses
        self.qtd_regular_calculada = self.qtd_frascos_regular * 3 #quantidade para 3 meses
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * 3 #quantidade para 3 meses
      else
        #utiliza 6 no calculo como refer??ncia ao m??s de junho
        self.qtd_nph_calculada = self.qtd_frascos_nph * (6 - self.data_envio.month)  #quantidade para meses restantes
        self.qtd_regular_calculada = self.qtd_frascos_regular * (6 - self.data_envio.month) #quantidade para  meses restantes
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * (6 - self.data_envio.month) #quantidade para meses restantes
      end
    elsif self.mes == 6#junho
      if self.data_envio.month <= 6
        self.qtd_nph_calculada = self.qtd_frascos_nph * 3 #quantidade para 3 meses
        self.qtd_regular_calculada = self.qtd_frascos_regular * 3 #quantidade para 3 meses
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * 3 #quantidade para 3 meses
      else
        #utiliza 9 no calculo como refer??ncia ao m??s de setembro
        self.qtd_nph_calculada = self.qtd_frascos_nph * (9 - self.data_envio.month)  #quantidade para meses restantes
        self.qtd_regular_calculada = self.qtd_frascos_regular * (9 - self.data_envio.month) #quantidade para  meses restantes
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * (9 - self.data_envio.month) #quantidade para meses restantes
      end
    elsif self.mes == 9 #setembro
      if self.data_envio.month <= 9
        self.qtd_nph_calculada = self.qtd_frascos_nph * 3 #quantidade para 3 meses
        self.qtd_regular_calculada = self.qtd_frascos_regular * 3 #quantidade para 3 meses
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * 3 #quantidade para 3 meses
      else
        #utiliza 12 no calculo como refer??ncia ao m??s de dezembro
        self.qtd_nph_calculada = self.qtd_frascos_nph * (12 - self.data_envio.month)  #quantidade para meses restantes
        self.qtd_regular_calculada = self.qtd_frascos_regular * (12 - self.data_envio.month) #quantidade para  meses restantes
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * (12 - self.data_envio.month) #quantidade para meses restantes
      end
    else #dezembro
      if self.data_envio.month == 12
        self.qtd_nph_calculada = self.qtd_frascos_nph * 3 #quantidade para 3 meses
        self.qtd_regular_calculada = self.qtd_frascos_regular * 3 #quantidade para 3 meses
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * 3 #quantidade para 3 meses
      else
        #utiliza 3 no calculo como refer??ncia ao m??s de mar??o
        self.qtd_nph_calculada = self.qtd_frascos_nph * (3 - self.data_envio.month)  #quantidade para meses restantes
        self.qtd_regular_calculada = self.qtd_frascos_regular * (3 - self.data_envio.month) #quantidade para  meses restantes
        #self.qtd_analoga_calculada = self.qtd_frascos_analoga * (3 - self.data_envio.month) #quantidade para meses restantes
      end
    end

  end
end
