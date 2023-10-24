FactoryBot.define do
  factory :course do
    name { "book name" }
    author { "book author" }
    state { :active }
    category { Category.first || create(:category) }
  end
end
