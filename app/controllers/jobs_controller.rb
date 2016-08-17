class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @locations = Job.locations
    @categories = Category.all

    if !params[:category].blank? && !params[:location].blank?
      @jobs = Job.by_location_and_category(params[:category], params[:location]).order_and_paginated(params[:page])
    elsif !params[:category].blank?
      @jobs = Job.by_category(params[:category]).order_and_paginated(params[:page])
    elsif !params[:location].blank?
      @jobs = Job.by_location(params[:location]).order_and_paginated(params[:page])
    else
      @jobs = Job.order_and_paginated(params[:page])
    end

  end

  def new
    @job = Job.new
  end

  def show
    @jobs = Job.all_sort_by_date.page.limit(8)
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to @job
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :company,:url, :location, :category_id, skill_ids:[], skills_attributes:[:name])
  end
end
