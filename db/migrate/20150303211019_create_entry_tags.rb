class CreateEntryTags < ActiveRecord::Migration
  def change
    create_table :entry_tags do |t|
      t.integer :entry_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
