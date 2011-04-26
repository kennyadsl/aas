require 'spec_helper'

describe Event do
  before(:each) do
    @attr = {
        :body => "Quisque eget odio ac lectus vestibulum faucibus eget in metus.",
        :location => "Los Angeles",
        :opponent => "Lakers",
        :is_indoor => true,
        :result_home => 12,
        :result_guest => 21,
        :date => "2011-04-26 14:48:00 UTC"       
        }
  end
  
  it "should be valid with all data filled" do
    all_data_event = Event.new(@attr)
    all_data_event.should be_valid
  end
end
