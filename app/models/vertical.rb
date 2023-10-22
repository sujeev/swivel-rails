class Vertical < ApplicationRecord
    has_many :categories, dependent: :destroy

    validates :name, presence: true
    validates_with UniqueNameValidator

    accepts_nested_attributes_for :categories
end
