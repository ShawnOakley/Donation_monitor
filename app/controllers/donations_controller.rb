class DonationsController < ApplicationController

	def new
		@user = User.find_by_id(params[:current_user_id])
	end

	def create 
		fail

	end
end
