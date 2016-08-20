class RenameUserIdComlumnJobs < ActiveRecord::Migration[5.0]
  def change
    rename_column :jobs, :user_id, :company_id
  end
end
