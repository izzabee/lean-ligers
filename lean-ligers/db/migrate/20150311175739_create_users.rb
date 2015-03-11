class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.string :session_token
    	t.string :industry, null: false
    	t.boolean :mentor

      t.timestamps null: false
    end
  end
end
