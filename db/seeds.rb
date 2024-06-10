require 'factory_bot_rails'

5.times do
  FactoryBot.create(:patient)
end

puts "#{Patient.all.count} patients created"

