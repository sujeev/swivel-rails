class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validates_with UniqueNameValidator

  enum :state, { active: 0, suspended: 1 }, default: :active

  accepts_nested_attributes_for :courses

  scope :active, -> { where(state: :active)}
end
