class EntryTag < ActiveRecord::Base
  belongs_to :entry
  belongs_to :course
end
