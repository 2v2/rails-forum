class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  has_many :comments
  has_many :entryTags
end
