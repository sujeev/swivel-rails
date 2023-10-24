FactoryBot.define do
  factory :category do
    name { "test_diet" }
    state { :active }
    vertical { Vertical.first || create(:vertical)  }
  end
end
