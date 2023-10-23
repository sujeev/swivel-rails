FactoryBot.define do
  factory :course do
    name { "book name" }
    author { "book author" }
    state { :course_active }
    category { Category.first || create(:category) }
  end
end
