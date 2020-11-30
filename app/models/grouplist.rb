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
 # direct
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:group, { :required => false, :class_name => "Group", :foreign_key => "group_id" })

  
end
