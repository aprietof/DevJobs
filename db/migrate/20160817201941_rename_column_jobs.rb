class RenameColumnJobs < ActiveRecord::Migration[5.0]
  def change
    rename_column :jobs, :company, :company_name
  end
end
