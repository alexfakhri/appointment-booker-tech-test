require_relative './lib/availability.rb'

appointment = Availability.new(ARGV[0])
puts appointment.appoinment_time
