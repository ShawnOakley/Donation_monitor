class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
    	t.string  :title
    	t.string  :description
    	t.float :latitude 
		  t.float :longitude
		  t.string :primary_contact_name
    	t.timestamps
    end
  end
end
