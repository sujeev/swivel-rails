FactoryBot.define do
  factory :course do
    name { "MyString" }
    author { "MyString" }
    state { "active" }
    category { Category.first || create(:category) }
  end
end
