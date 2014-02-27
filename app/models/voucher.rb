class Voucher < ActiveRecord::Base
	has_many :donations, :as => :donatable

	attr_accessible :title, :description, :expiration_date

	validates_presence_of :expiration_date

end
