class Event < ActiveRecord::Base
  
  has_many :pictures, :dependent => :destroy
  
  attr_accessible :opponent, :date, :location, :body, :is_indoor, :result_home, :result_guest, :title
  
  validates_presence_of :body, :title

  default_scope :order => 'created_at DESC'

  scope :future, lambda { where('date > ?', Date.today) }
  scope :past, lambda { where('date <= ?', Date.today) }

end
