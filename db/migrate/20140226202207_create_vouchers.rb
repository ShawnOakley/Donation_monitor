class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
    	t.string  :title
    	t.string  :description
    	t.datetime :expiration_date
    	t.timestamps
    end
  end
end
