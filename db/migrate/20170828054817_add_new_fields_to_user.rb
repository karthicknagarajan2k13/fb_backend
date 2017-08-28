class AddNewFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :age, :integer
  	add_column :users, :gender, :integer
  	add_column :users, :image, :string
  	add_column :users, :role_id, :integer
  	add_column :users, :terms, :boolean
  end
end
