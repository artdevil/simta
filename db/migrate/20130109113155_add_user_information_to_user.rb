class AddUserInformationToUser < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :birthday, :string
    add_column :users, :address, :string
    add_column :users, :gender, :string
    add_column :users, :department, :string
    add_column :users, :religion, :string
    add_column :users, :avatar, :string
  end
end
