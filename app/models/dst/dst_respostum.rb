# == Schema Information
#
# Table name: dst_resposta
#
#  id                  :integer          not null, primary key
#  dst_questionario_id :integer
#  dst_solicitacao_id  :integer
#  valor               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_dst_resposta_on_dst_questionario_id  (dst_questionario_id)
#  index_dst_resposta_on_dst_solicitacao_id   (dst_solicitacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_questionario_id => dst_questionarios.id)
#  fk_rails_...  (dst_solicitacao_id => dst_solicitacaos.id)
#

class DstRespostum < ApplicationRecord
  belongs_to :dst_questionario
  belongs_to :dst_solicitacao

  #Metodo que retorna o nome do objeto
  def to_s
    self.valor
  end
end
