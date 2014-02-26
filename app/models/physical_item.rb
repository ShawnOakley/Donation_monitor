class PhysicalItem < ActiveRecord::Base
	has_many :donations, as: donation_type

	attr_accessible :height, 
					:width,
					:weight

	validates_presence_of :height, :width, :weight

end
