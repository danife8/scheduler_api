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
class Patient < ApplicationRecord
  ## VALIDATIONS
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  ## ASSOCIATIONS
  has_many :appointments
end
