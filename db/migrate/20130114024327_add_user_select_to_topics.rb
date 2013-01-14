class AddUserSelectToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :user_select, :string
  end
end
