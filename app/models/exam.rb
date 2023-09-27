class Exam < ApplicationRecord
  belongs_to :college, optional: true
end
