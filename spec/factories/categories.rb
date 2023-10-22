FactoryBot.define do
  factory :category do
    name { "test_diet" }
    vertical { Vertical.first || create(:vertical)  }
  end
end
