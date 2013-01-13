class Topic < ActiveRecord::Base
	belongs_to :users
  attr_accessible :abstract, :description, :status, :title, :user_id, :tag_list
  acts_as_taggable
  validates :abstract, :description, :title, :presence => true
end
