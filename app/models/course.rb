class Course < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :author, presence: true
  enum :state, { active: 0, suspended: 1 }
end
