class Player < ActiveRecord::Base
  attr_accessible :full_name, :role, :occupation, :city, :bio, :image
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
end
