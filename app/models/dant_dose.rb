# == Schema Information
#
# Table name: dant_doses
#
#  id              :integer          not null, primary key
#  tipo_insulina   :string
#  dose_diaria     :integer
#  frascos_mensais :integer
#  dant_pacient_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_dant_doses_on_dant_pacient_id  (dant_pacient_id)
#
# Foreign Keys
#
#  fk_rails_...  (dant_pacient_id => dant_pacients.id)
#

class DantDose < ApplicationRecord
  belongs_to :dant_pacient

  before_save :set_frascos

  extend Enumerize

  enumerize :tipo_insulina, in: [:nph, :regular,:nph_de_caneta], predicates: true

  #Método que seta a quantidade de frascos mensais
  def set_frascos
    case self.dose_diaria
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
