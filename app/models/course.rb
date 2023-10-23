class Course < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :author, presence: true
  enum :state, { course_active: 0, course_suspended: 1 }, default: :course_active
end
