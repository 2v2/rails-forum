class Comment < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
	belongs_to :parent, :class_name => "Comment", :foreign_key => "parent_comment_id"
	has_many :child_comments, :class_name => "Comment", :foreign_key => "parent_comment_id"
end
