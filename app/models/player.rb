class Player < ActiveRecord::Base
  attr_accessible :full_name, :role, :occupation, :city, :bio, :image
  
  mount_uploader :image, ImageUploader
end
