class VehiclesController < ApplicationController
	before_action :set_vehicle, only: [:show, :edit, :update, :destroy]


	def index
		@vehicles = Vehicle.all
	end

	def show
		@user_id = @vehicle.user_id
	end

	def new
		@vehicle = Vehicle.new
	end

	def edit
	end

	def create
		@vehicle = Vehicle.new(vehicle_params)
		@vehicle.user_id = current_user.id

		respond_to do |format|
			if @vehicle.save
				format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
				format.json { render :show, status: :created, location: @vehicle }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @vehicle.errors, status: :unprocessable_entity }
			end
		end
		binding.pry
	end
	def update
		respond_to do |format|
			if @vehicle.update(vehicle_params)
					format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
					format.json { render :show, status: :ok, location: @vehicle }
			else
					format.html { render :edit, status: :unprocessable_entity }
					format.json { render json: @vehicle.errors, status: :unprocessable_entity }
			end
		end
	end
	def destroy
		@vehicle.destroy
		respond_to do |format|
			format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
			format.json { head :no_content }
		end
	end
	def set_vehicle
		@vehicle = Vehicle.find(params[:id])
	end
	def vehicle_params
		params.require(:vehicle).permit(:name, :vehicle_number, :color, :modle, :avatar, :user_id)
	end
end