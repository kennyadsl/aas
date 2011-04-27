class Challenge < ActiveRecord::Base
  attr_accessible :opponent, :date, :email, :body, :location, :is_accepted
  
  validates_presence_of :opponent, :email, :body, :location
end
