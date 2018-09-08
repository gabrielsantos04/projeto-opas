# == Schema Information
#
# Table name: escala_salsas
#
#  id                   :integer          not null, primary key
#  paciente_id          :integer
#  notificacao_id       :integer
#  data_entrevista      :date
#  entrevistador        :string
#  questao_1            :integer
#  questao_2            :integer
#  questao_3            :integer
#  questao_4            :integer
#  questao_5            :integer
#  questao_6            :integer
#  questao_7            :integer
#  questao_8            :integer
#  questao_9            :integer
#  questao_10           :integer
#  questao_11           :integer
#  questao_12           :integer
#  questao_13           :integer
#  questao_14           :integer
#  questao_15           :integer
#  questao_16           :integer
#  questao_17           :integer
#  questao_18           :integer
#  questao_19           :integer
#  questao_20           :integer
#  escore_facil         :integer
#  escore_pouco_dificil :integer
#  escore_muito_dificil :integer
#  escore_nao_preciso   :integer
#  escore_fisicamente   :integer
#  escore_evito         :integer
#  escore_salsa         :integer
#  escore_risco         :integer
#  condicoes_medicas    :text
#  adaptacoes           :text
#  responsavel          :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_escala_salsas_on_notificacao_id  (notificacao_id)
#  index_escala_salsas_on_paciente_id     (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#

class EscalaSalsa < ApplicationRecord
  belongs_to :paciente, optional: true
  belongs_to :notificacao, optional: true

  before_save :calcula_escores_parciais,:calcula_escore_risco,:calcula_escore_salsa

  #Método que calcul os escores parciais
  def calcula_escores_parciais
    self.escore_facil = 0
    self.escore_pouco_dificil = 0
    self.escore_muito_dificil = 0
    self.escore_nao_preciso = 0
    self.escore_fisicamente = 0
    self.escore_evito = 0

    self.attributes.each do |attr_name, attr_value|
      if attr_name.include?("questao")
        case attr_value
          when 1
            self.escore_facil += attr_value
          when 2
            self.escore_pouco_dificil += attr_value
          when 3
            self.escore_muito_dificil += attr_value
          when 0
            self.escore_nao_preciso += attr_value
          when 4
            self.escore_fisicamente += attr_value
          when 5
            self.escore_evito += (attr_value - 1)
        end
      end
    end
  end

  #Método que calcula o escore de risco
  def calcula_escore_risco
    self.escore_risco = 0
    if self.questao_3 == 4 || self.questao_3 == 5
      self.escore_risco += 1
    end
    if self.questao_4 == 4 || self.questao_4 == 5
      self.escore_risco += 1
    end
    if self.questao_5 == 4 || self.questao_5 == 5
      self.escore_risco += 1
    end
    if self.questao_7 == 4 || self.questao_7 == 5
      self.escore_risco += 1
    end
    if self.questao_9 == 4 || self.questao_9 == 5
      self.escore_risco += 1
    end
    if self.questao_10 == 4 || self.questao_10 == 5
      self.escore_risco += 1
    end
    if self.questao_11 == 4 || self.questao_11 == 5
      self.escore_risco += 1
    end
    if self.questao_12 == 4 || self.questao_12 == 5
      self.escore_risco += 1
    end
    if self.questao_13 == 4 || self.questao_13 == 5
      self.escore_risco += 1
    end
    if self.questao_15 == 4 || self.questao_15 == 5
      self.escore_risco += 1
    end
    if self.questao_18 == 4 || self.questao_18 == 5
      self.escore_risco += 1
    end
  end

  #Método que calcula o escore salsa
  def calcula_escore_salsa
    self.escore_salsa = self.escore_facil + self.escore_pouco_dificil + self.escore_muito_dificil + self.escore_nao_preciso + self.escore_fisicamente + self.escore_evito = 0
  end
  
end
