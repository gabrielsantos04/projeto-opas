# == Schema Information
#
# Table name: pacientes
#
#  id          :integer          not null, primary key
#  nome        :string
#  nome_mae    :string
#  idade       :integer
#  peso        :decimal(, )
#  endereco    :string
#  latitude    :string
#  longitude   :string
#  sexo        :integer
#  telefone    :string
#  cidade_id   :integer
#  ocupacao_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_pacientes_on_cidade_id    (cidade_id)
#  index_pacientes_on_ocupacao_id  (ocupacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (ocupacao_id => ocupacaos.id)
#

class Paciente < ApplicationRecord
  belongs_to :cidade, counter_cache: true
  belongs_to :ocupacao

  has_many :notificacaos


  def to_s
    self.nome
  end


end
