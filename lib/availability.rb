require 'time'
require 'json'

class Availability

  FIRST_SLOT = "08:00"
  LAST_SLOT = "15:00"

  attr_reader :time_requested, :available_times

  def initialize(time_requested = ARGV[0])
    @time_requested = format_time(time_requested)
    @available_times =  parse_json
    check_time_requested(@time_requested)
  end

  def format_time(time_requested)
    time = Time.parse(time_requested)
    time.strftime("%T")
  end

  def parse_json
    file = File.read('./availability_slots.json')
    @available_time = JSON.parse(file)['availability_slots']
  end

  def check_time_requested(time)
     raise "Please select a time between #{FIRST_SLOT} & #{LAST_SLOT}" if (time < FIRST_SLOT || time > LAST_SLOT)
  end

  def available_time
    @index = @available_times.find_index { |time, index| time["time"] == time_requested }
    while @available_times[@index].has_key?("available") do
      @index += 1
    end
      @available_times[@index].values_at("time")[0]
  end

  def final_time_format(time)
    final_time = Time.parse(time)
    final_time.strftime("%H:%M")
  end

  def appoinment_time
    "Your appointment time is #{final_time_format(available_time)}"
  end

end
