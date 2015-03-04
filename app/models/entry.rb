class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  has_many :comments
  has_many :entry_tags, dependent: :destroy
  has_many :viewers, through: :entry_tags, source: :user

  	def is_tagged?(user)
    true if user.id == self.user_id
    entry_tags.where(user_id: user.id).exists?
  end
end
