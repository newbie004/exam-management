class Exam < ApplicationRecord
  belongs_to :college, optional: true
  has_one :exam_window
end
