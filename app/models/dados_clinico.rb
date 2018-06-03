# == Schema Information
#
# Table name: dados_clinicos
#
#  id                        :integer          not null, primary key
#  lesoes_cultaneas          :integer
#  forma_clinica             :string
#  classificacao_operacional :string
#  nervos_afetados           :integer
#  notificacao_id            :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_dados_clinicos_on_notificacao_id  (notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (notificacao_id => notificacaos.id)
#

class DadosClinico < ApplicationRecord
  belongs_to :notificacao

  validates_presence_of DadosClinico.attribute_names - %w(id created_at updated_at notificacao_id)

  extend Enumerize

  enumerize :forma_clinica, in: [:i, :t,:d,:v], predicates: true
  enumerize :classificacao_operacional, in: [:multibacilar, :paucibacilar], predicates: true
end
