# == Schema Information
#
# Table name: bcgs
#
#  id                     :integer          not null, primary key
#  primeira_dose          :date
#  segunda_dose           :date
#  cicatriz               :boolean
#  notificacao_contato_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_bcgs_on_notificacao_contato_id  (notificacao_contato_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_contato_id => notificacao_contatos.id)
#

class Bcg < ApplicationRecord
  belongs_to :notificacao_contato
end
