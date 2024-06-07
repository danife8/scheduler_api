# == Schema Information
#
# Table name: availabilities
#
#  id            :integer          not null, primary key
#  date          :datetime
#  end_time      :time
#  start_time    :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  specialist_id :integer          not null
#
# Indexes
#
#  index_availabilities_on_specialist_id  (specialist_id)
#
# Foreign Keys
#
#  specialist_id  (specialist_id => specialists.id)
#
FactoryBot.define do
  factory :availability do
    date { Faker::Date.in_date_period }
    start_time { Faker::Time.between(from: Time.zone.today, to: Time.zone.today) }
    end_time { start_time + 30.minutes }
    specialist { nil }
  end
end
