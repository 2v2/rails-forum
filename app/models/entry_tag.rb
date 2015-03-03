class EntryTag < ActiveRecord::Base
	belongs_to :entries
	belongs_to :courses
end
