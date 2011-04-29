class Event < ActiveRecord::Base
  
  has_many :pictures, :dependent => :destroy
  
  attr_accessible :opponent, :date, :location, :body, :is_indoor, :result_home, :result_guest, :title
  
  validates_presence_of :opponent, :location, :body, :title

  default_scope :order => 'created_at DESC'

end
