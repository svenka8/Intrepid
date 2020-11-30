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
  #direct
  has_many(:courselists, { :class_name => "Courselist", :foreign_key => "course_id", :dependent => :destroy })

  #indirect
  has_many(:users, { :through => :courselists, :source => :user })
end
