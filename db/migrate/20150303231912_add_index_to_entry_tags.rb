class AddIndexToEntryTags < ActiveRecord::Migration
  def change
  	add_index :entry_tags, [:entry_id, :course_id], unique: true
  end
end
