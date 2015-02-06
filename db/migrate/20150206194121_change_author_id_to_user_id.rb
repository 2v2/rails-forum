class ChangeAuthorIdToUserId < ActiveRecord::Migration
  def change
  	remove_column :entries, :author_id
  	add_column :entries, :user_id, :integer

  	remove_column :comments, :author_id
  	add_column :comments, :user_id, :integer
  end
end
