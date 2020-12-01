# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  assessment :boolean
#  claim      :boolean
#  collection :boolean
#  proactive  :boolean
#  status     :string
#  tasking    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Answer < ApplicationRecord
  #direct
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
end

