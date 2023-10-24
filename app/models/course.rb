class Course < ApplicationRecord
  searchkick
  belongs_to :category

  validates :name, presence: true
  validates :author, presence: true
  enum :state, { active: 0, suspended: 1 }, default: :active

  scope :active, -> { where(state: :active)}
end
