# == Schema Information
#
# Table name: avaliacao_neurologicas
#
#  id                       :integer          not null, primary key
#  avaliacao_notificacao_id :integer
#  data                     :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  olhos_sem_forca_d        :decimal(, )
#  olhos_sem_forca_e        :decimal(, )
#  olhos_com_forca_d        :decimal(, )
#  olhos_com_forca_e        :decimal(, )
#  triquiase_d              :string
#  triquiase_e              :string
#  ectropio_d               :string
#  ectropio_e               :string
#  catarata_d               :string
#  catarata_e               :string
#  sensibilidade_cornea_d   :string
#  sensibilidade_cornea_e   :string
#  opacidade_corneana_d     :string
#  acuidade_visual_d        :decimal(, )
#  acuidade_visual_e        :decimal(, )
#  ressecamento_d           :string
#  ressecamento_e           :string
#  feridas_d                :string
#  feridas_e                :string
#  perfuracao_septo_d       :string
#  nervo_radial_d           :string
#  nervo_radial_e           :string
#  nervo_ulnar_d            :string
#  nervo_mediano_d          :string
#  nervo_mediano_e          :string
#  abducao_5_dedo_d         :integer
#  abducao_5_dedo_e         :integer
#  abducao_polegar_d        :integer
#  abducao_polegar_e        :integer
#  extensores_punho_d       :integer
#  extensores_punho_e       :integer
#  nervo_fibular_d          :string
#  nervo_fibular_e          :string
#  nervo_tibial_d           :string
#  nervo_tibial_e           :string
#  extensao_halux_d         :integer
#  extensao_halux_e         :integer
#  dorsiflexao_pe_d         :integer
#  dorsiflexao_pe_e         :integer
#  opacidade_corneana_e     :string
#  perfuracao_septo_e       :string
#  nervo_ulnar_e            :string
#
# Indexes
#
#  index_avaliacao_neurologicas_on_avaliacao_notificacao_id  (avaliacao_notificacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_notificacao_id => avaliacao_notificacaos.id)
#

class AvaliacaoNeurologica < ApplicationRecord
  belongs_to :avaliacao_notificacao
  validates_presence_of AvaliacaoNeurologica.attribute_names - %w(id created_at updated_at avaliacao_notificacao_id)
end
