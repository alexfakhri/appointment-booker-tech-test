require_relative './lib/availability.rb'

time_requested = ARGV[0]

appointment = Availability.new(time_requested)
puts appointment.appoinment_time
