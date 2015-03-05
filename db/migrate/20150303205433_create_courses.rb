class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
