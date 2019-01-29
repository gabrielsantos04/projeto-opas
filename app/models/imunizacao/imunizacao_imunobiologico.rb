# == Schema Information
#
# Table name: imunizacao_imunobiologicos
#
#  id                          :integer          not null, primary key
#  tipo                        :string
#  nome_vacina                 :string
#  imunizacao_vacina_id        :integer
#  imunizacao_solicitacao_id   :integer
#  status                      :string
#  justificativa_indeferimento :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  imunizacao_indication_id    :integer
#
# Indexes
#
#  index_imunizacao_imunobiologicos_on_imunizacao_indication_id   (imunizacao_indication_id)
#  index_imunizacao_imunobiologicos_on_imunizacao_solicitacao_id  (imunizacao_solicitacao_id)
#  index_imunizacao_imunobiologicos_on_imunizacao_vacina_id       (imunizacao_vacina_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_indication_id => imunizacao_indications.id)
#  fk_rails_...  (imunizacao_solicitacao_id => imunizacao_solicitacaos.id)
#  fk_rails_...  (imunizacao_vacina_id => imunizacao_vacinas.id)
#

class ImunizacaoImunobiologico < ApplicationRecord
  belongs_to :imunizacao_vacina, optional: true
  belongs_to :imunizacao_solicitacao, optional: true
  belongs_to :imunizacao_indication
  has_many :imunizacao_esquemas, dependent: :destroy

  accepts_nested_attributes_for :imunizacao_esquemas, allow_destroy: true
  extend Enumerize
  enumerize :status, in: [:deferido, :indeferido], predicates: true


  #Método que retorna o nome do objeto
  def to_s
    if self.imunizacao_vacina.present?
      self.imunizacao_vacina
    else
      self.nome_vacina
    end
  end
end
