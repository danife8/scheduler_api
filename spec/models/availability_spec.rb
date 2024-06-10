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
require 'rails_helper'

RSpec.describe Availability do
  context 'with specialist defined' do
    let(:specialist) { create(:specialist) }
    let(:availability) { build(:availability, specialist: specialist) } # rubocop: disable Style/HashSyntax

    it 'creates with valid attributes' do
      expect(availability).to be_valid
    end

    it 'not create with invalid date' do
      availability.date = 2.days.ago
      expect(availability).not_to be_valid
    end
  end

  context 'without specialist defined' do
    it 'creates with valid attributes' do
      expect(build(:availability)).not_to be_valid
    end
  end
end
