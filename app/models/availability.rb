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
class Availability < ApplicationRecord
  # TODO || BUSINESS LOGIC:
  # Validate 'date' uniqueness per 'specialist'
  # Validate 'start_time' > now
  # Validate 'end_time' > 'start_time'
  # Validate 'end_time' = 'start_time' + X.hours

  ## VALIDATIONS
  validate :date, :not_past_date
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  ## ASSOCIATIONS
  belongs_to :specialist

  private
  
  def not_past_date
    return unless date < Time.zone.today
    errors.add(:date, 'not in past')
  end
end
