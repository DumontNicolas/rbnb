class ChangeRoleTypeToBoolean < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :role, :string
    add_column :reviews, :role, :boolean
  end
end
