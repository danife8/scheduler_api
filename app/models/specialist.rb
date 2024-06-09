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
class Specialist < ApplicationRecord
  # TODO || BUSINESS LOGIC:
  # Specialist probably could inherit common attributes from a 'User' class
  # Validate uniquness of specialists by 'email'

  ## VALIDATIONS
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :specialty, presence: true

  ## ASSOCIATIONS
  has_many :availabilities, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
