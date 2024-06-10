require 'factory_bot_rails'

5.times do
  FactoryBot.create(:patient)
end
puts "#{Patient.all.count} patients created"

5.times do
  FactoryBot.create(:specialist)
end
puts "#{Specialistt.all.count} specialists created"
