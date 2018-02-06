# == Schema Information
#
# Table name: diagnostico_recidivas
#
#  id             :integer          not null, primary key
#  recidiva_id    :integer
#  diagnostico_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_diagnostico_recidivas_on_diagnostico_id  (diagnostico_id)
#  index_diagnostico_recidivas_on_recidiva_id     (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (diagnostico_id => diagnosticos.id)
#  fk_rails_...  (recidiva_id => recidivas.id)
#

class DiagnosticoRecidiva < ApplicationRecord
  belongs_to :recidiva
  belongs_to :diagnostico
end
