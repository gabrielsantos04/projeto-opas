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

  enumerize :tipo_insulina, in: [:nph_frascos, :regular_frascos,:nph_de_caneta, :regular_de_caneta], predicates: true

  #Método que seta a quantidade de frascos mensais
  def set_frascos
    if self.tipo_insulina == "nph_frascos" || self.tipo_insulina == "regular_frascos"
      quantidade = self.dose_diaria / 33
      if self.dose_diaria % 33 != 0
        quantidade = quantidade + 1
      end
      self.frascos_mensais = quantidade
    else
      quantidade = self.dose_diaria / 10
      if self.dose_diaria % 10 != 0
        quantidade = quantidade + 1
      end
      self.frascos_mensais = quantidade
    end

  end
end
