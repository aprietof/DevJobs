class JobApplicationsController < ApplicationController
  before_action :set_job_application, :except => [:index, :new, :create]

  def index
    @items_per_page = 9
    @latest_jobs = Job.all_sort_by_date_skip_first

    if params[:user_id]
      @job_applications = User.find(params[:user_id]).job_applications.order_and_paginated(params[:page], @items_per_page)
    else
      @job_applications = JobApplication.order_and_paginated(params[:page], @items_per_page)
    end
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.find_by_user_id_and_job_id(params[:job_application][:user_id], params[:job_application][:job_id])
    if !@job_application.nil?
      redirect_to root_path, alert: "You already applied for this job."
    else
      @job_application = JobApplication.new(job_application_params)
      if @job_application.save
        redirect_to root_path, alert: "Your application has ben sent. Good Luck!"
      else
        render_to new_job_application_path, alert: "Oops, there was a problem, please try again"
      end
    end
  end

  def show
    @jobs = Job.all_sort_by_date.limit(8)
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
    params.require(:job_application).permit(:user_id, :job_id, :message, :years_of_experience)
  end
end
