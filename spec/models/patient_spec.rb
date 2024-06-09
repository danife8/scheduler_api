# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  email      :string
#  lastname   :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Patient do
  it 'creates with valid attributes' do
    expect(create(:patient)).to be_valid
  end

  it 'fail creating with missing name' do
    patient = build(:patient)
    patient.name = nil
    expect(patient).not_to be_valid
  end

  it 'fail creating with missing lastname' do
    patient = build(:patient)
    patient.lastname = nil
    expect(patient).not_to be_valid
  end

  it 'fail creating with missing phone' do
    patient = build(:patient)
    patient.phone = nil
    expect(patient).not_to be_valid
  end

  it 'fail creating with missing email' do
    patient = build(:patient)
    patient.email = nil
    expect(patient).not_to be_valid
  end
end
