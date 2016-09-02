class RemoveJobIdFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :job_id
  end
end
