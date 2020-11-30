# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bio             :text
#  email           :string
#  experience      :boolean
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  group_id        :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
#direct associations
  has_many(:grouplists, { :class_name => "Grouplist", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:courselists, { :class_name => "Courselist", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:answers, { :class_name => "Answer", :foreign_key => "user_id", :dependent => :destroy })
#indirect associations
  has_many(:groups, { :through => :grouplists, :source => :group })

  has_many(:courses, { :through => :courselists, :source => :course })
end
