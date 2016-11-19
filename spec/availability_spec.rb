require 'availability'
require 'spec_helper'

describe Availability do

  let(:availability) { described_class.new}

  it 'initializes with argument passed in as ARGV and returns the time format that matches json file' do
    ARGV[0] = "08:00"
    expect(subject.time_requested).to eq "08:00:00"
  end

  it 'initializes with a json object with available appointments' do
    expect(subject.available_times).to include ({ "time"=>"08:00:00", "slot_size"=>10, "doctor_id"=>1 })
  end

  it 'will raise an error on initialization if the time is outstide the oppening hours' do
    ARGV[0] = "07:00"
    expect { subject.check_time_requested(time_requested) }.to raise_error "Please select a time between #{Availability::FIRST_APPOINTMENT} & #{Availability::LAST_APPOINTMENT}"
  end

  it 'will return the time in the same format as the time given as ARGV ' do
    ARGV[0] = "12:40"
    expect(subject.final_time_format(ARGV[0])).to eq "12:40"
  end

  it "should return the final appointment time based on availability" do
    ARGV[0] = "08:00"
    expect(subject.appoinment_time).to eq "Your appointment time is #{ARGV[0]}"
  end

  it 'it should write the availability to the json file' do
    ARGV[0] = "08:00"
    expect(subject.available_times).to include ({ "time"=> "08:00:00", "slot_size"=> 10, "doctor_id"=> 1, "available"=> false })
  end


end
