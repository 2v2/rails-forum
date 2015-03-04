class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  has_many :comments
  has_many :entry_tags, dependent: :destroy
  has_many :viewers, through: :entry_tags, source: :course

  def is_viewer?(user)
    true if self.entry_tags.includes(user.course_id)
    entry_tags.where(user.course_id).exists?
  end
end
