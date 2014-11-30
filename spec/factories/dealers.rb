FactoryGirl.define do
  factory :dealer do
    sequence(:name) { |n| "Dealer #{n}" }
    city 'Oklahoma City'
    state 'OK'
    zip '73129'
  end
end
