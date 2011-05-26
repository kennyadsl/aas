class Picture < ActiveRecord::Base

  belongs_to :event
  
  attr_accessible :event_id, :title

   has_attached_file :paperclip,
                  :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
