class AddUserInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :address, :string
    add_column :users, :department, :string
  end
end
