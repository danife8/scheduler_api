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
  ## VALIDATIONS
  validates :date, presence: true, uniqueness: { scope: :specialist }
  validates :start_time, presence: true
  validates :end_time, presence: true

  ## ASSOCIATIONS
  belongs_to :specialist
end
