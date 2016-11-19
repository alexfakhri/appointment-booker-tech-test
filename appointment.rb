require_relative './lib/availability.rb'

if ARGV.empty?
  puts "Please provide an appointment time, eg. 12:10"
else
  time_requested = ARGV[0]
  appointment = Availability.new(time_requested)
  puts appointment.appoinment_time
end
