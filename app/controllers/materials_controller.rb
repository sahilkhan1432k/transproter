class MaterialsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_material, only: %i[ show edit update destroy ]
	before_action :set_plant, only: [:show, :edit, :new, :create]

	def index
		@materials = Material.all
	end
	

	def show
	end

	def new
		@material = Material.new
	end
	

	def edit
	end

	def create
		@material = @plant.materials.create(material_params)
		

		respond_to do |format|
		if @material.save
				format.html { redirect_to @plant, notice: "Material was successfully created." }
				format.json { render :show, status: :created, location: @material }
		else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @plant.errors, status: :unprocessable_entity }
		end
		end
	end

	def update
		respond_to do |format|
		if @material.update(material_params)
				format.html { redirect_to @material, notice: "Material was successfully updated." }
				format.json { render :show, status: :ok, location: @material }
		else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @material.errors, status: :unprocessable_entity }
		end
		end
	end

	def destroy
		@material.destroy
		respond_to do |format|
		format.html { redirect_to materials_url, notice: "Material was successfully destroyed." }
		format.json { head :no_content }
		end
	end
	

	def set_material
	@material = Material.find(params[:id])
	end

	def set_plant
		@plant = Plant.find(params[:plant_id])
	end

	def material_params
	params.require(:material).permit(:name, :cost, :avatar, :plant_id)
	end

end	
