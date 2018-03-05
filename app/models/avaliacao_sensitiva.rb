# == Schema Information
#
# Table name: avaliacao_sensitivas
#
#  id                       :integer          not null, primary key
#  avaliacao_notificacao_id :integer
#  data                     :date
#  dedao_direito            :integer
#  indicador_d_ponta        :integer
#  indicador_d              :integer
#  mindinho_d_ponta         :integer
#  mindinho_d               :integer
#  mao_direita              :integer
#  mao_d_costa              :integer
#  dedao_esquerdo           :integer
#  indicador_e_ponta        :integer
#  indicador_e              :integer
#  mindinho_e_ponta         :integer
#  mindinho_e               :integer
#  mao_esquerda             :integer
#  mao_e_costa              :integer
#  pe_direito               :integer
#  pe_d_1_ponta             :integer
#  pe_d_3_ponta             :integer
#  pe_d_5_ponta             :integer
#  pe_d_1                   :integer
#  pe_d_3                   :integer
#  pe_d_5                   :integer
#  pe_d_e1                  :integer
#  pe_d_calcanhar           :integer
#  pe_esquerdo              :integer
#  pe_e_1_ponta             :integer
#  pe_e_3_ponta             :integer
#  pe_e_5_ponta             :integer
#  pe_e_1                   :integer
#  pe_e_3                   :integer
#  pe_e_5                   :integer
#  pe_e_e1                  :integer
#  pe_e_e2                  :integer
#  pe_e_calcanhar           :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  pe_d_e2                  :integer
#
# Indexes
#
#  index_avaliacao_sensitivas_on_avaliacao_notificacao_id  (avaliacao_notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_notificacao_id => avaliacao_notificacaos.id)
#

class AvaliacaoSensitiva < ApplicationRecord
  belongs_to :avaliacao_notificacao
  has_many :marcacaos
  has_one :paciente, through: :avaliacao_notificacao
  has_many :sensitiva_images

  accepts_nested_attributes_for :marcacaos, allow_destroy: true
end
