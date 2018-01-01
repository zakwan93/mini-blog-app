class CreateProfile < ActiveRecord::Migration[5.1]
  def change
  	create_table :profile do |t|
        t.string :profilepic
        t.string :user_id
    end
  end
end
