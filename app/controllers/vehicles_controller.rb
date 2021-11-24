class VehiclesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
	before_action :set_drivers, only: [:new, :edit, :update, :destroy, :create]

	def index
		@vehicles = Vehicle.all
	end
	
	def show
		@user_id = @vehicle.user_id
		@user = User.find(@vehicle.user_id)
		@job_application = @vehicle.job_applications

	end

	def new
		@vehicle = Vehicle.new
		
	end

	def my_vehicles
		@vehicles = Vehicle.all
	end

	def edit
    if @vehicle.user_id == current_user.id
    else
			redirect_to vehicles_path,class: 'alert alert-warning',notice: "Not Authorized to this vehicle"
		end

	end


	def create
		@vehicle = Vehicle.new(vehicle_params)
		@vehicle.user_id = current_user.id
		if params[:vehicle][:first_driver_id].present?
			@vehicle.first_driver = User.find(params[:vehicle][:first_driver_id])
		end
		if params[:vehicle][:second_driver_id].present?
			@vehicle.second_driver = User.find(params[:vehicle][:second_driver_id])
		end
		respond_to do |format|
			if @vehicle.save
				format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
				format.json { render :show, status: :created, location: @vehicle }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @vehicle.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		if @vehicle.user_id == current_user.id
			if params[:vehicle][:first_driver_id].present?
				@vehicle.first_driver = User.find(params[:vehicle][:first_driver_id])
			end
			if params[:vehicle][:second_driver_id].present?
				@vehicle.second_driver = User.find(params[:vehicle][:second_driver_id])
			end
			respond_to do |format|
				if @vehicle.update(vehicle_params)
						format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
						format.json { render :show, status: :ok, location: @vehicle }
				else
						format.html { render :edit, status: :unprocessable_entity }
						format.json { render json: @vehicle.errors, status: :unprocessable_entity }
				end
			end
		else
			redirect_to vehicles_path, notice: "Not Authorized to this vehicle"
		end
	end

	def destroy
		if @vehicle.user_id == current_user.id
			@vehicle.destroy
			respond_to do |format|
				format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
				format.json { head :no_content }
			end
		else
			redirect_to vehicles_path, notice: "Not Authorized to this vehicle"
		end
	end

	def set_vehicle
		@vehicle = Vehicle.find(params[:id])
	end

	def set_drivers
		@first_driver_ids = User.where(user_type:  User::USER_TYPE_FIRST_DRIVER).pluck(:first_name, :id)
		@second_driver_ids = User.where(user_type: User::USER_TYPE_SECOND_DRIVER).pluck(:first_name, :id)
	end

	def vehicle_params
		params.require(:vehicle).permit(:name, :vehicle_number, :color, :modle, :avatar, :user_id, :my_vehicles )
	end
	
end