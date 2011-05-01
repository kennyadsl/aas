class Player < ActiveRecord::Base
  
  attr_accessible :full_name, :role, :occupation, :city, :bio
  
  has_attached_file :paperclip, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.random
    Player.offset(rand(Player.count)).first
  end

end
