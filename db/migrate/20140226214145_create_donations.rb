class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
    	t.integer :user_id
    	t.references :donations, polymorphic: true
     	t.timestamps
    end
  end
end
