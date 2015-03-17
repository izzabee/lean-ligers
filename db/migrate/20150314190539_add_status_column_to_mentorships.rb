class AddStatusColumnToMentorships < ActiveRecord::Migration
  def change
  	add_column :mentorships, :confirmed, :boolean, default: false
  end
end
