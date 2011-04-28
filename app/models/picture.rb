class Picture < ActiveRecord::Base

  belongs_to :event
  
  attr_accessible :event_id, :image
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
