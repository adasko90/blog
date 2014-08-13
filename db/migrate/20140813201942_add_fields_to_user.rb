class AddFieldsToUser < ActiveRecord::Migration
  def change
        add_column :users, :nickname, :string
        add_column :users, :admin, :boolean, :default => false
  end
end
