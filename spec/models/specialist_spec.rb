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
  pending "add some examples to (or delete) #{__FILE__}"
end
