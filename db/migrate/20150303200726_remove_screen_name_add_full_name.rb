class RemoveScreenNameAddFullName < ActiveRecord::Migration
  def change
  	remove_column :users, :screen_name
  	add_column :users, :first_name, :text
  	add_column :users, :last_name, :text
  	add_column :users, :course, :text
  	add_column :users, :linked_in, :text
  	add_column :users, :twitter, :text
  	add_column :users, :facebook, :text
  	add_column :users, :github, :text
  end
end
