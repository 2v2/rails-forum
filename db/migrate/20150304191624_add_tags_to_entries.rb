class AddTagsToEntries < ActiveRecord::Migration
  def change
  add_column :entries, :tags, :string, array: true
  end
end
