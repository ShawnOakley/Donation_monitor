class Donation < ActiveRecord::Base
	belongs_to :user, :class_name => 'User'
	belongs_to :donatable, polymorphic: true
end
