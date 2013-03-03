FactoryGirl.define do
  factory :item do
		location
  end
end

FactoryGirl.define do
  factory :user do
  end
end

FactoryGirl.define do
  factory :location do
		lat 55.9500
		lng 3.2200
  end
end
