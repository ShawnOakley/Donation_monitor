class Voucher < ActiveRecord::Base
	has_many :donations, :as => :donation_type

	attr_accessible :expiration_date

	validates_presence_of :expiration_date

end
