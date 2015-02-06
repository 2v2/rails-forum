class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :screen_name
      t.text :password_digest

      t.timestamps null: false
    end
  end
end
