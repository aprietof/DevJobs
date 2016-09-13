class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :company_name, :url,
   :location, :created_at, :company_id, :created_at
  has_one :category
end

# t.string   "title"
# t.text     "description"
# t.string   "company_name"
# t.string   "url"
# t.string   "location"
# t.datetime "created_at",   null: false
# t.datetime "updated_at",   null: false
# t.integer  "category_id"
# t.integer  "company_id"
