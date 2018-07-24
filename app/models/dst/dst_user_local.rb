# == Schema Information
#
# Table name: dst_user_locals
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  dst_local_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_dst_user_locals_on_dst_local_id  (dst_local_id)
#  index_dst_user_locals_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (dst_local_id => dst_locals.id)
#  fk_rails_...  (user_id => users.id)
#

class DstUserLocal < ApplicationRecord
  belongs_to :user
  belongs_to :dst_local
end
