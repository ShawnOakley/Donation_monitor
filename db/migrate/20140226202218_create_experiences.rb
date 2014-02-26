class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
    	t.integer :latitude 
		t.integer :longitude
		t.string :primary_contact_name
    	t.timestamps
    end
  end
end
