class CreatePost < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
        t.string :title
        t.text :content
        t.string :user_id
    end
  end
end
