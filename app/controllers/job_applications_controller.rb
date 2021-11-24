class JobApplicationsController < ApplicationController
  before_action :set_jobapplication, only: %i[  edit update destroy ]

  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_applications = JobApplication.all
  end

  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.find(params[:id])
    @user = @job_application.user
  end

  def interviewed
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.find(params[:id])
    if @job_application.interviewed!
      redirect_to vehicle_job_applications_url, notice: "Candidate has been  Successfuly Called for Interview." 
    else
      redirect_to vehicle_job_applications_url, notice: "some thing has went wrong try again"
    end
  end

  def shortlisted
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.find(params[:id])
    if @job_application.shortlisted!
      redirect_to vehicle_job_applications_url, notice: "Candidate has been Shortlisted."
    else
      redirect_to vehicle_job_applications_url, notice: "some thing has went wrong try again"
    end
  end

  def hired
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.find(params[:id])
    if @job_application.hired!
      redirect_to vehicle_job_applications_url, notice: "Candidate hasbeen Successfuly Hired."
    else
      redirect_to vehicle_job_applications_url, notice: "some thing has went wrong try again"
    end
  end

  def rejected
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.find(params[:id])
    if @job_application.rejected!
      redirect_to vehicle_job_applications_url, notice: "Candidate has been Rejected Successfuly."
    else
      redirect_to vehicle_job_applications_url, notice: "some thing has went wrong try again"
    end
  end

  def approve
    @job_application = JobApplication.find(params[:job_application_id])
    @user = @job_application.user 
    if current_user.id == @user.id  
    else
      if @user.user_type == "first_driver"
        @apprive_first = @job_application.vehicle.update(first_driver:@job_application.user)
        redirect_to vehicle_job_applications_url, notice: "Candidate hasbeen Successfuly Hired."
       
      else
        @apprive_second = @job_application.vehicle.update(second_driver:@job_application.user)
        redirect_to vehicle_job_applications_url, notice: "Candidate hasbeen Successfuly Hired."
      end
    end
  end

  def new
    @job_application = Job_application.new
    @job_application.user_id = current_user
    @user_id = current_user.id
  end

  def edit
  end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.new(job_application_params)
    @user_id = current_user.id
    @email = current_user.email
    @name = current_user.first_name
    @job_application.user_id = current_user.id
    @job_application.user = current_user
    @vehicle = Vehicle.find(params[:vehicle_id])
    @job_application = @vehicle.job_applications.create(job_application_params)
    @job_application.user_id = current_user.id
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to vehicle_job_applications_url, notice: "Job_application was successfully created." }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: "Job_application was successfully updated." }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: "Job_application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_job_application
      @vehicle = Vehicle.find(params[:vehicle_id])
      @job_application = @vehicle.job_application.find(params[:id])
    end

    def job_application_params
      params.require(:job_application).permit(:name, :email, :description, :user_id, :vehicle_id, :cv, :content )
    end
end
