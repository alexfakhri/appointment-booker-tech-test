require 'time'

class Availability

  attr_reader :time_requested

  def initialize(time_requested = ARGV[0])
    @time_requested = format_time(time_requested)
  end

  def format_time(time_requested)
    time = Time.parse(time_requested)
    time.strftime("%T")
  end

end
