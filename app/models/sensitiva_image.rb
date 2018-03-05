# == Schema Information
#
# Table name: sensitiva_images
#
#  id                     :integer          not null, primary key
#  imagem                 :string
#  avaliacao_sensitiva_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  opcao                  :string
#
# Indexes
#
#  index_sensitiva_images_on_avaliacao_sensitiva_id  (avaliacao_sensitiva_id)
#
# Foreign Keys
#
#  fk_rails_...  (avaliacao_sensitiva_id => avaliacao_sensitivas.id)
#

class SensitivaImage < ApplicationRecord
  belongs_to :avaliacao_sensitiva

  #mount_uploader :imagem, ImageUploader
  mount_base64_uploader :imagem, ImageUploader
end
