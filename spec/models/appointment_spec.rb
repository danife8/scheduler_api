# == Schema Information
#
# Table name: appointments
#
#  id            :integer          not null, primary key
#  date          :datetime
#  time          :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  patient_id    :integer          not null
#  specialist_id :integer          not null
#
# Indexes
#
#  index_appointments_on_patient_id     (patient_id)
#  index_appointments_on_specialist_id  (specialist_id)
#
# Foreign Keys
#
#  patient_id     (patient_id => patients.id)
#  specialist_id  (specialist_id => specialists.id)
#
require 'rails_helper'

RSpec.describe Appointment do
  let(:specialist) { create :specialist, :with_availability }
  let(:patient) { create :patient }

  context 'with patient and specialist' do
    let(:appointment) do
      Appointment.new(
        date: specialist.availabilities.first.date,
        time: specialist.availabilities.first.start_time,
        specialist: specialist,
        patient: patient
        )
    end

    it 'with valid parameters' do
      expect(appointment).to be_valid
    end

    it 'with invalid date' do
      appointment.date = nil
      expect(appointment).not_to be_valid
    end

    it 'with invalid time' do
      appointment.time = nil
      expect(appointment).not_to be_valid
    end
  end
end
