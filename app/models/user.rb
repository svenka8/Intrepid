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
end
