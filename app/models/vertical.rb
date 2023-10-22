class Vertical < ApplicationRecord
    validates :name, presence: true
    validates_with UniqueNameValidator
end
