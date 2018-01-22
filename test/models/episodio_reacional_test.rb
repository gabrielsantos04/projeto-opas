# == Schema Information
#
# Table name: episodio_reacionals
#
#  id                     :integer          not null, primary key
#  notificacao_id         :integer
#  tipo                   :string
#  numero_episodios       :integer
#  conduta_mendicamentosa :string
#  data_inicio            :date
#  data_termino           :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_episodio_reacionals_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

require 'test_helper'

class EpisodioReacionalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
