# == Schema Information
#
# Table name: dant_regions
#
#  id         :integer          not null, primary key
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DantRegion < ApplicationRecord
  has_many :dant_cidade_regions

  accepts_nested_attributes_for :dant_cidade_regions, allow_destroy: true
end
