class CreateUserQuestions < ActiveRecord::Migration
  def change
    create_table :user_questions do |t|
    	t.string :answer
    	t.references :user
    	t.references :question

      t.timestamps null: false
    end
  end
end
