# == Schema Information
#
# Table name: imunizacao_files
#
#  id                        :integer          not null, primary key
#  descricao                 :string
#  anexo                     :string
#  imunizacao_solicitacao_id :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_imunizacao_files_on_imunizacao_solicitacao_id  (imunizacao_solicitacao_id)
#
# Foreign Keys
#
#  fk_rails_...  (imunizacao_solicitacao_id => imunizacao_solicitacaos.id)
#

class ImunizacaoFile < ApplicationRecord
  belongs_to :imunizacao_solicitacao
  mount_uploader :anexo, ImageUploader
end
