# == Schema Information
#
# Table name: dst_solicitacaos
#
#  id           :integer          not null, primary key
#  dst_local_id :integer
#  observacoes  :text
#  user_id      :integer
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  token        :string
#
# Indexes
#
#  index_dst_solicitacaos_on_dst_local_id  (dst_local_id)
#  index_dst_solicitacaos_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_local_id => dst_locals.id)
#  fk_rails_...  (user_id => users.id)
#

class DstSolicitacao < ApplicationRecord
  require 'uniquify'
  belongs_to :dst_local
  belongs_to :user
  has_many :dst_solicitacao_produtos
  has_many :dst_resposta

  accepts_nested_attributes_for :dst_resposta, allow_destroy: true
  accepts_nested_attributes_for :dst_solicitacao_produtos, allow_destroy: true
  uniquify :token, length: 7, chars: 0..9

  def to_s
    "Solicitação Nº#{self.id}"
  end

end
