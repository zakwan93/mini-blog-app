class CreateUser < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
        t.string :fname
        t.string :lname
        t.string :username
        t.string :password
        t.string :age
    end
  end
end
