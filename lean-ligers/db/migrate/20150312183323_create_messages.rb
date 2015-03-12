class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string :subject, null: false
    	t.string :content, null: false
    	t.integer :mentor_id, null: false
    	t.integer :mentee_id, null: false
    	t.boolean :read, default: false

      t.timestamps null: false
    end

    add_index :messages, :mentor_id
    add_index :messages, :mentee_id
  end
end
