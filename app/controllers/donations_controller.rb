class DonationsController < ApplicationController

	def new
		@user = User.find_by_id(params[:current_user_id])
	end

	def create 

		@donation = Donation.new
		@user_id = params[:current_user_id]

		case params[:donation_type]
		when 'voucher'
			@voucher = Voucher.new(params[:voucher])
			if @voucher.save
				@donation = Donation.new
				@donation.donation_type_id = @voucher.id
				@donation.user_id = @user_id
				if @donation.save
					fail
					# redirect to show page
				else
					fail
					# flash error
				end
			else
				fail
				# flash error
			end
		when 'experience'
			@experience = Experience.new(params[:exp])
			if @experience.save
				@donation = Donation.new
				@donation.donation_type_id = @experience.id
				@donation.user_id = @user_id
				if @donation.save
					fail
					# redirect to show page
				else
					fail
					# flash error
				end
			else
				fail
				# flash error
			end
		when 'physical_item'
			@physical_item = PhysicalItem.new(params[:phys])
			if @physical_item.save
				@donation = Donation.new
				@donation.donation_type_id = @physical_item.id
				@donation.user_id = @user_id
				if @donation.save
					fail
					# redirect to show page
				else
					fail
					# flash error
				end
			else
				fail
				# flash error
			end
		fail
		end
	end
end
