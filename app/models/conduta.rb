# == Schema Information
#
# Table name: conduta
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conduta < ApplicationRecord
  has_many :conduta_recidivas

  def to_s
    self.nome
  end
end
