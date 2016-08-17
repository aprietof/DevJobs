class JobsSkill < ApplicationRecord
  belongs_to :job
  belongs_to :skill
end
