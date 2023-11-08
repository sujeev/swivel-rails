class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :author, :state

  belongs_to :category
end
