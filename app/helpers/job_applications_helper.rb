module JobApplicationsHelper

  def current_job
    job = Job.find(params[:job_id])
  end
end
