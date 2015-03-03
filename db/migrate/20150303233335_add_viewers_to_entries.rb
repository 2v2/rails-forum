class AddViewersToEntries < ActiveRecord::Migration
  def change


  	def is_tagged?(consumer)
    true if consumer.id == self.consumer_id
    shared_boards.where(consumer_id: consumer.id).exists?
  end
  end
end
