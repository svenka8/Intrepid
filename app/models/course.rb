# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_name :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord
end
