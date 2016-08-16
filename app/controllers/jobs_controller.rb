class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

  def index
    @jobs = Job.all.page(params[:page]).per(5)
  end

  def new
    @job = Job.new
  end

  def show
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
    params.require(:job).permit(:title, :description, :company,:url, :location)
  end
end
