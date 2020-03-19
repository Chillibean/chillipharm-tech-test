FactoryGirl.define do
  factory :saved_search do
    library
    name "Search's name"
    keyword "key"
    sort 'created_at_asc'
    filter 'any'
  end

end
