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
			# fail
			params[:id] = params[:current_user_id]
			case params[:donation_type]
			when 'Voucher'
				@voucher = instance
				render :template => 'donations/voucher/show'
			when 'Experience'
				@experience = instance
				render :template => 'donations/experience/show'
			when 'Physical Item'
				@physical_item = instance
				render :template => 'donations/physicalItem/show'
			end
		else
			fail
			# flash error
		end
	end

	def create 

		@donation = Donation.new
		@user_id = params[:current_user_id]
		case params[:donation_type]
		when 'Voucher' || 'voucher'
			@voucher = Voucher.new(params[:donation])
			if @voucher.save
				save_polymorphic_item(@voucher)	
			else
				fail
				# flash error
			end
		when 'Experience' || 'experience'
			@experience = Experience.new(params[:donation])
			if @experience.save
				save_polymorphic_item(@experience)
			else
				fail
				# flash error
			end
		when 'physical_item' || 'Physical Item'
			params[:donation][:donatable_type] = "PhysicalItem"
			params[:donation_type] = "PhysicalItem"
			@physical_item = PhysicalItem.new(params[:donation])
			if @physical_item.save
				save_polymorphic_item(@physical_item)
			else
				fail
				# flash error
			end
		end
	end

	def show
		# fail
		case params[:type]
		when 'voucher' || 'Voucher'
			@voucher = Voucher.find_by_id(params[:id])
			render :template => 'donations/voucher/show'
		when 'experience' || 'Experience'
			@experience = Experience.find_by_id(params[:id])
			render :template => 'donations/experience/show'
		when 'physical_item' || 'Physical Item'
			@physical_item = PhysicalItem.find_by_id(params[:id])
			render :template => 'donations/physicalItem/show'
		end
	end
end
