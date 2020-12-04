# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
  #direct
  has_many(:grouplists, { :class_name => "Grouplist", :foreign_key => "group_id", :dependent => :destroy })

  #indirect

  has_many(:users, { :through => :grouplists, :source => :user })

  
  
end


