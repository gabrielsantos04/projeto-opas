# == Schema Information
#
# Table name: monofilamentos
#
#  id            :integer          not null, primary key
#  nome          :string
#  cor           :string
#  interpretacao :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Monofilamento < ApplicationRecord
end
