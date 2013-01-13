class Topic < ActiveRecord::Base
  attr_accessible :abstract, :description, :status, :title, :user_id
end
