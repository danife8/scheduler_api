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
class Appointment < ApplicationRecord
  ## TODO || BUSINESS LOGIC:
  # Set a default appointment interval. DEFAULT_TIME = 30.minutes
  # Uniqueness validation in 'date' for patient <=> specialist
  # Validate 'time' if the patient already has other appointment -
  # - with another specialist
  # Validate 'time' and 'date' inside specialist availability

  ## Validations
  validates :time, presence: true
  validates :date, presence: true

  ## ASSOCIATIONS
  belongs_to :patient
  belongs_to :specialist
end
