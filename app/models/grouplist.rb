# == Schema Information
#
# Table name: grouplists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#
class Grouplist < ApplicationRecord
end
