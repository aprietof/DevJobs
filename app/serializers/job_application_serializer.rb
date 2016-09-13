class JobApplicationSerializer < ActiveModel::Serializer
  attributes :id
  has_one :job
end

# t.integer  "job_id"
# t.integer  "user_id"
# t.text     "message"
# t.datetime "created_at"
