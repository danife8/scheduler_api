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
require 'rails_helper'

RSpec.describe Specialist do
  it 'creates with valid attributes' do
    expect(create(:specialist)).to be_valid
  end

  it 'fail creating with missing name' do
    specialist = build(:specialist)
    specialist.name = nil
    expect(specialist).not_to be_valid
  end

  it 'fail creating with missing lastname' do
    specialist = build(:specialist)
    specialist.lastname = nil
    expect(specialist).not_to be_valid
  end

  it 'fail creating with missing phone' do
    specialist = build(:specialist)
    specialist.phone = nil
    expect(specialist).not_to be_valid
  end

  it 'fail creating with missing email' do
    specialist = build(:specialist)
    specialist.email = nil
    expect(specialist).not_to be_valid
  end

  it 'fail creating with missing specialty' do
    specialist = build(:specialist)
    specialist.specialty = nil
    expect(specialist).not_to be_valid
  end
end
