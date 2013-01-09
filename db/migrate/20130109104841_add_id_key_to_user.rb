class AddIdKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :id_key, :string
  end
end
