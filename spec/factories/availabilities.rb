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
    date { Time.zone.today }
    start_time { Time.zone.parse('09:00') }
    end_time { Time.zone.parse('17:00') }
    specialist { nil }
  end
end
