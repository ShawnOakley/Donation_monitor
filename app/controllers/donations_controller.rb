class DonationsController < ApplicationController

	def new
		@user = User.find_by_id(params[:current_user_id])
	end

	def save_polymorphic_item(instance)
		@donation = Donation.new
		@donation.donatable_id = instance.id
		@donation.donatable_type = params[:donation_type]
		@donation.user_id = @user_id
		if @donation.save
			new_params = {type: params[:donation_type], id: instance.id}
			redirect_to user_donation_path(new_params)
		else
			fail
			# flash error
		end
	end

	def create 

		@donation = Donation.new
		@user_id = params[:current_user_id]

		case params[:donation_type]
		when 'Voucher'
			@voucher = Voucher.new(params[:voucher])
			if @voucher.save
				save_polymorphic_item(@voucher)	
			else
				fail
				# flash error
			end
		when 'Experience'
			@experience = Experience.new(params[:exp])
			if @experience.save
				save_polymorphic_item(@experience)
			else
				fail
				# flash error
			end
		when 'Physical Item'
			@physical_item = PhysicalItem.new(params[:phys])
			if @physical_item.save
				save_polymorphic_item(@physical_item)
			else
				fail
				# flash error
			end
		end
	end

	def show
		case params[:type]
		when 'voucher'
			@voucher = Voucher.find_by_id(params[:id])
			render :template => 'donations/voucher/show'
		when 'experience'
			@experience = Experience.find_by_id(params[:id])
			render :template => 'donations/experience/show'
		when 'physical_item'
			@physical_item = PhysicalItem.find_by_id(params[:id])
			render :template => 'donations/physicalItem/show'
		end
	end
end
