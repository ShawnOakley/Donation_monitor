class Experience < ActiveRecord::Base
	has_many :donations, :as => :donatable

	attr_accessible :latitude, :longitude, :primary_contact_name

	validates_presence_of :latitude, :longitude, :primary_contact_name

def location
	[self.latitude, self.longitude]
end

def location(coordinate_array)
	self.latitude = coordinate_array[0]
	self.longitude = coordinate_array[1]
end

end
