# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  assessment :boolean
#  claim      :boolean
#  collection :boolean
#  proactive  :boolean
#  tasking    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Answer < ApplicationRecord
end
