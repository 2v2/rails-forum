class RemoveScreenNameAddFullName < ActiveRecord::Migration
  def change
  	remove_column :user, :screen_name
  	add_column :user, :first_name, :text
  	add_column :user, :last_name, :text
  	add_column :user, :course, :text
  	add_column :user, :linked_in, :text
  	add_column :user, :twitter, :text
  	add_column :user, :facebook, :text
  	add_column :user, :github, :text
  end
end
