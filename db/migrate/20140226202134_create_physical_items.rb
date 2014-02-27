class CreatePhysicalItems < ActiveRecord::Migration
  def change
    create_table :physical_items do |t|
    	t.string  :title
    	t.string  :description
    	t.integer :height
		t.integer :width
		t.integer :weight
      	t.timestamps
    end
  end
end
