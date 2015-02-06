class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :description

      t.timestamps null: false
    end
  end
end
