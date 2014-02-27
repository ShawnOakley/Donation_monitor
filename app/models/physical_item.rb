class PhysicalItem < ActiveRecord::Base
	has_many :donations, :as => :donatable

	attr_accessible :title, 
					:description, 
					:height, 
					:width,
					:weight

	validates_presence_of :height, :width, :weight

end
