# == Schema Information
#
# Table name: dst_questionarios
#
#  id         :integer          not null, primary key
#  titulo     :string
#  descricao  :text
#  ativo      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DstQuestionario < ApplicationRecord
  def to_s
    self.titulo
  end
end
