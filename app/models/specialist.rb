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
  ## VALIDATIONS
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :specialty, presence: true

  ## ASSOCIATIONS
  has_many :availabilities
  has_many :appointments
  has_many :patients, through: :appointments
end
