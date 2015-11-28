FactoryGirl.define do
  factory :visited_page do
    association :visitor
    page 1
    accessed_at DateTime.now
  end

end
