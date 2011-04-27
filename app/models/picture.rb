class Picture < ActiveRecord::Base
  belongs_to :event
  
  attr_accessible :event_id, :image
  
end
