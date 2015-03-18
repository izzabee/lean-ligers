class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.string :session_token
    	t.string :industry, null: false
      t.string :quote
      t.string :fun_fact
      t.string :link

      t.timestamps null: false
    end
    
    add_index :users, :email, unique: true
  end
end
