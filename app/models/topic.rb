class Topic < ActiveRecord::Base
	belongs_to :users
	# has_one :user_select, :primary_key => "user_select", :foreign_key => "id_key", :class_name => "User"
  attr_accessible :abstract, :description, :status, :title, :user_id, :tag_list, :user_select
  acts_as_taggable
  validates :abstract, :description, :title, :presence => true
end
