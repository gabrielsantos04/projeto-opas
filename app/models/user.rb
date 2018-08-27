# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  nome                   :string
#  cpf                    :string
#  email                  :string
#  cidade_id              :integer
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#
# Indexes
#
#  index_users_on_cidade_id             (cidade_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class User < ApplicationRecord
  has_many :dst_user_locals
  has_many :dst_locals, through: :dst_user_locals
  has_many :dst_movimentacaos, through: :dst_locals
  has_many :dst_solicitacaos, through: :dst_locals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :cidade

  extend Enumerize

  enumerize :role, in: [
      :administrador, :municipio_hans,:municipio_dant,:municipio_dst,:referencia, :admin_dant,:admin_hans,
      :admin_dst, :dst_produtos
  ], predicates: true

  def to_s
    self.nome
  end
end
