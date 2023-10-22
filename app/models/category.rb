class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validates_with UniqueNameValidator

  accepts_nested_attributes_for :courses
end
