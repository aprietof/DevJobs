class JobApplicationsController < ApplicationController
  # before_action :set_job_application, :except => [:index]

  def index
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    raise params.inspect
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @job_application.destroy
    redirect_to root_path
  end

  private
  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_id, :message)
  end
end
