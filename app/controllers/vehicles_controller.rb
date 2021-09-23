class VehiclesController < ApplicationController

    def index
        @vehicles = Vehicle.all
    end

    def show
    end

    def new
        @vehicle = Vehicle.new
    end

    def edit
        @vehicle = vehicle.find(:id)
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)

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
        params.require(:vehicle).permit(:name, :vehicle_number, :color, :modle, :avatar)
    end
end