class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :skills do |t|
      t.index [:job_id, :skill_id]
      # t.index [:_id, :_id]
    end
  end
end
