class Category < ApplicationRecord
  belongs_to :vertical

  validates :name, presence: true
  validates_with UniqueNameValidator
end
