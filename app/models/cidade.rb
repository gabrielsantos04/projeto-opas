# == Schema Information
#
# Table name: cidades
#
#  id              :integer          not null, primary key
#  nome            :string
#  uf              :string
#  latitude        :string
#  longitude       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  pacientes_count :integer          default(0)
#

class Cidade < ApplicationRecord
  has_many :pacientes
  has_many :users

  def to_s
    self.nome
  end
end
