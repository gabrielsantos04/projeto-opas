# == Schema Information
#
# Table name: dant_pacients
#
#  id              :integer          not null, primary key
#  nome            :string
#  sexo            :integer
#  endereco        :string
#  rg              :string
#  cpf             :string
#  tipo_insulina   :string
#  hipertenso      :boolean
#  diabetico       :boolean
#  tabagista       :boolean
#  etilista        :boolean
#  obeso           :boolean
#  grau_obesidade  :integer
#  cidade_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  frascos_diarios :integer
#  frascos_mensais :integer
#  obito           :boolean
#  data_obito      :date
#  data_nascimento :date
#
# Indexes
#
#  index_dant_pacients_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class DantPacient < ApplicationRecord
  belongs_to :cidade

  extend Enumerize

  validates :nome, :data_nascimento, :cidade_id,:sexo, :frascos_diarios,:tipo_insulina, presence: true

  enumerize :grau_obesidade, in: {:grau_1 => 1, :grau_2 => 2, :grau_3 => 3}, predicates: true
  enumerize :sexo, in: {:masculino => 1, :feminino => 2}, predicates: true
  enumerize :tipo_insulina, in: [:nph, :regular,:analoga], predicates: true
  
  
  before_save :set_frascos


  #Método que retorna a idade do paciente
  def idade
    Date.today.year - self.data_nascimento.year
  end

  #Método que retorna o nome do objeto
  def to_s
    self.nome
  end

  #Método que seta a quantidade de frascos mensais
  def set_frascos 
    case self.frascos_diarios
      when 1..33
        self.frascos_mensais = 1
      when 34..66
        self.frascos_mensais = 2
      when 67..99
        self.frascos_mensais = 3
      when 100..132
        self.frascos_mensais = 4
    end
  end
end
