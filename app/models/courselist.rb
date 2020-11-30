# == Schema Information
#
# Table name: courselists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  user_id    :integer
#
class Courselist < ApplicationRecord
end
