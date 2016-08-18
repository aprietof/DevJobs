class AddYearsOfExperienceToJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applications, :years_of_experience, :integer
  end
end
