class VerticalSerializer
  include JSONAPI::Serializer
  attributes :name

  has_many :categories
end
