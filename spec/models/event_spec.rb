require 'spec_helper'

describe Event do
  before(:each) do
    @attr = {
        :title => "Titolone evento",
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

  it "should return last inserted events first" do
    old_event = Event.create(@attr)
    recent_event= Event.create(@attr)
    Event.find(:all, :limit => 5).first.id.should == recent_event.id
  end

end
