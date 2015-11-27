FactoryGirl.define do
  factory :visited_page do
    association :visitor
    page 1
  end

end
