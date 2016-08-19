class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]
  after_action :verify_authorized, except: :index

  def index
    @items_per_page = 5
    @latest_jobs = Job.all_sort_by_date_skip_first
    @locations = Job.locations
    @categories = Category.all

    if !params[:category].blank? && !params[:location].blank?
      @jobs = Job.by_location_and_category(params[:category], params[:location]).order_and_paginated(params[:page], @items_per_page)
    elsif !params[:category].blank?
      @jobs = Job.by_category(params[:category]).order_and_paginated(params[:page], @items_per_page)
    elsif !params[:location].blank?
      @jobs = Job.by_location(params[:location]).order_and_paginated(params[:page], @items_per_page)
    else
      @jobs = Job.order_and_paginated(params[:page], @items_per_page)
    end

  end

  def new
    @job = Job.new
    authorize @job
  end

  def show
    @jobs = Job.all_sort_by_date.page.limit(8)
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    authorize @job

    if @job.save
      redirect_to @job, alert: "Job offer succesfully created"
    else
      render new_job_path, alert: "Oops!, please try again!"
    end
  end

  def edit
    authorize @job
  end

  def update
    authorize @job
    @job.update(job_params)
    redirect_to @job, alert: "Job offer succesfully updated"
  end

  def destroy
    authorize @job
    @job.destroy
    redirect_to root_path, alert: "Job offer succesfully deleted"
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :company_name ,:url, :location, :category_id, :user_id, skill_ids:[], skills_attributes:[:name])
  end
end
