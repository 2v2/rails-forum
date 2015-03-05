class RemoveCourseFromUserAddCourseId < ActiveRecord::Migration
  def change
  	add_column :users, :course_id, :integer
  	remove_column :users, :course
  end
end
