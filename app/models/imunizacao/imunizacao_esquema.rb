# == Schema Information
#
# Table name: imunizacao_esquemas
#
#  id                            :integer          not null, primary key
#  imunizacao_imunobiologicos_id :integer
#  dose                          :string
#  esquema                       :string
#  status                        :string
#  justificativa                 :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_imunizacao_esquemas_on_imunizacao_imunobiologicos_id  (imunizacao_imunobiologicos_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_imunobiologicos_id => imunizacao_imunobiologicos.id)
#

class ImunizacaoEsquema < ApplicationRecord
  belongs_to :imunizacao_imunobiologicos
end
