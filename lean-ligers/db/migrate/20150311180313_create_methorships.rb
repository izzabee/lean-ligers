class CreateMethorships < ActiveRecord::Migration
  def change
    create_table :methorships do |t|
    	t.integer :mentor_id
    	t.integer :mentee_id

      t.timestamps null: false
    end
  end
end
