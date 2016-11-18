require 'time'
require 'json'

class Availability

  attr_reader :time_requested, :available_times

  def initialize(time_requested = ARGV[0])
    @time_requested = format_time(time_requested)
    @available_times =  parse_json
  end

  def format_time(time_requested)
    time = Time.parse(time_requested)
    time.strftime("%T")
  end

  def parse_json
    file = File.read('./availability_slots.json')
    @available_time = JSON.parse(file)['availability_slots']
  end

end


# appointment = Availability.new
# puts appointment.appoinment_time
