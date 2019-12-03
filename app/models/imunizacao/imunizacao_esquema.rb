# == Schema Information
#
# Table name: imunizacao_esquemas
#
#  id                           :integer          not null, primary key
#  dose                         :string
#  esquema                      :string
#  status                       :string
#  justificativa                :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  imunizacao_imunobiologico_id :integer
#  lote                         :string
#
# Indexes
#
#  index_imunizacao_esquemas_on_imunizacao_imunobiologico_id  (imunizacao_imunobiologico_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_imunobiologico_id => imunizacao_imunobiologicos.id)
#

class ImunizacaoEsquema < ApplicationRecord
  belongs_to :imunizacao_imunobiologico
  has_many :imunizacao_encerramentos, dependent: :destroy
  has_one :imunizacao_solicitacao, through: :imunizacao_imunobiologico

  accepts_nested_attributes_for :imunizacao_encerramentos, allow_destroy: true


  extend Enumerize
  enumerize :status, in: [:concluido, :nao_aplicado], predicates: true
  enumerize :dose, in: [:d1, :d2, :d3,:d4, :ref1, :ref2, :du], predicates: true
end
