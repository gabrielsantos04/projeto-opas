# == Schema Information
#
# Table name: imunizacao_vacina_indications
#
#  id                       :integer          not null, primary key
#  imunizacao_vacina_id     :integer
#  imunizacao_indication_id :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
# Indexes
#
#  index_imunizacao_vacina_indications_on_imunizacao_indication_id  (imunizacao_indication_id)
#  index_imunizacao_vacina_indications_on_imunizacao_vacina_id      (imunizacao_vacina_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_indication_id => imunizacao_indications.id)
#  fk_rails_...  (imunizacao_vacina_id => imunizacao_vacinas.id)
#

class ImunizacaoVacinaIndication < ApplicationRecord
  belongs_to :imunizacao_vacina, optional: true
  belongs_to :imunizacao_indication, optional: true
end
