FactoryGirl.define do
  factory :contact, :class => Contact do
    association :visitor
    name "RDOER"
    email "rdoer@mail.com"
  end
end
