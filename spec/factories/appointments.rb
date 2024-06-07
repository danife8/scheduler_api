# == Schema Information
#
# Table name: appointments
#
#  id            :integer          not null, primary key
#  date          :datetime
#  time          :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  patients_id   :integer          not null
#  specialist_id :integer          not null
#
# Indexes
#
#  index_appointments_on_patients_id    (patients_id)
#  index_appointments_on_specialist_id  (specialist_id)
#
# Foreign Keys
#
#  patients_id    (patients_id => patients.id)
#  specialist_id  (specialist_id => specialists.id)
#
FactoryBot.define do
  factory :appointment do
    date { Faker::Date.in_date_period }
    time { Faker::Time.between(from: 2.days.ago, to: Time.zone.today) }
    patients { nil }
    specialist { nil }
  end
end
