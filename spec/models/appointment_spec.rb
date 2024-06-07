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
require 'rails_helper'

RSpec.describe Appointment do
  pending "add some examples to (or delete) #{__FILE__}"
end
