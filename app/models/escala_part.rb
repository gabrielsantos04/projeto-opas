# == Schema Information
#
# Table name: escala_parts
#
#  id               :integer          not null, primary key
#  questao_1        :string
#  questao_1_valor  :integer
#  questao_2        :string
#  questao_2_valor  :integer
#  questao_3        :string
#  questao_3_valor  :integer
#  questao_4        :string
#  questao_4_valor  :integer
#  questao_5        :string
#  questao_5_valor  :integer
#  questao_6        :string
#  questao_6_valor  :integer
#  questao_7        :string
#  questao_7_valor  :integer
#  questao_8        :string
#  questao_8_valor  :integer
#  questao_9        :string
#  questao_9_valor  :integer
#  questao_10       :string
#  questao_10_valor :integer
#  questao_11       :string
#  questao_11_valor :integer
#  questao_12       :string
#  questao_12_valor :integer
#  questao_13       :string
#  questao_13_valor :integer
#  questao_14       :string
#  questao_14_valor :integer
#  questao_15       :string
#  questao_15_valor :integer
#  questao_16       :string
#  questao_16_valor :integer
#  questao_17       :string
#  questao_17_valor :integer
#  questao_18       :string
#  questao_18_valor :integer
#  data_entrevista  :date
#  entrevistador    :string
#  grau_restricao   :string
#  comentario       :text
#  paciente_id      :integer
#  notificacao_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  total            :integer
#
# Indexes
#
#  index_escala_parts_on_notificacao_id  (notificacao_id)
#  index_escala_parts_on_paciente_id     (paciente_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#  fk_rails_...  (paciente_id => pacientes.id)
#

class EscalaPart < ApplicationRecord
  belongs_to :paciente
  belongs_to :notificacao

  extend Enumerize

  enumerize :grau_restricao, in: [:sem_restricao_significativa, :leve_restricao, :restricao_moderada, :restricao_grave,:restricao_extrema], predicates: true

  before_save :calcular_total

  #Método que calcula o grau de restrição
  def calcular_total
    self.total = (self.questao_1_valor + self.questao_2_valor + self.questao_3_valor + self.questao_4_valor + self.questao_5_valor+self.questao_6_valor+self.questao_7_valor+self.questao_8_valor+self.questao_9_valor+self.questao_10_valor+self.questao_11_valor+self.questao_12_valor+self.questao_13_valor+self.questao_14_valor+self.questao_15_valor+self.questao_16_valor+self.questao_17_valor+self.questao_18_valor)
    if self.total <= 12
      self.grau_restricao = :sem_restricao_significativa
    elsif self.total.between? 13, 22
      self.grau_restricao = :leve_restricao
    elsif self.total.between? 23, 32
      self.grau_restricao = :restricao_moderada
    elsif self.total.between? 33,52
      self.grau_restricao = :restricao_grave
    elsif self.total >= 53
      self.grau_restricao = :restricao_extrema
    end

  end
end
