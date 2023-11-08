class CategorySerializer
  include JSONAPI::Serializer
  attributes :name, :state

  has_many :courses
  belongs_to :vertical
end
