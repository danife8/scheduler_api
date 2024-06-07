# == Schema Information
#
# Table name: specialists
#
#  id         :integer          not null, primary key
#  email      :string
#  lastname   :string
#  name       :string
#  phone      :string
#  specialty  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :specialist do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    phone { Faker::PhoneNumber.phone_number }
    specialty { Faker::Job.position }
  end

  trait :with_availability do
    after(:create) do |specialist|
      create(:availability, specialist_id: specialist.id)
    end
  end
end
