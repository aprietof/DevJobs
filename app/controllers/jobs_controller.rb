class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @categories = Category.all
    if !params[:category.blank?]
      @jobs = Job.by_category(params[:category]).all_sort_by_date.page(params[:page]).per(5)
    else
      @jobs = Job.all_sort_by_date.page(params[:page]).per(5)
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
    params.require(:job).permit(:title, :description, :company,:url, :location, :category_id)
  end
end
