class AddingCommentNumberToEntries < ActiveRecord::Migration
  def change
  add_column :entries, :comment_num, :integer
  end
end
