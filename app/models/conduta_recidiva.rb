# == Schema Information
#
# Table name: conduta_recidivas
#
#  id          :integer          not null, primary key
#  condutas_id :integer
#  recidiva_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_conduta_recidivas_on_condutas_id  (condutas_id)
#  index_conduta_recidivas_on_recidiva_id  (recidiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (condutas_id => condutas.id)
#  fk_rails_...  (recidiva_id => recidivas.id)
#

class CondutaRecidiva < ApplicationRecord
  belongs_to :conduta
  belongs_to :recidiva, optional: true
end
