# == Schema Information
#
# Table name: queixas
#
#  id         :integer          not null, primary key
#  nome       :string
#  categoria  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Queixa < ApplicationRecord
end
