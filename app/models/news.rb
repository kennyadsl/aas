class News < ActiveRecord::Base
  attr_accessible :body, :link
  
  link_regex = /\A(^\z|http:\/\/+.+)\z/i #empty or valid link
  
  validates :body, :presence => true
  validates :link, :format => { :with => link_regex }
  
  before_validation :add_http

  default_scope :order => 'created_at DESC'
  
  private
  def add_http
    if self.link && !self.link.blank? & !self.link.match(/^http:\/\//)
      self.link = "http://"+self.link
    end
  end
  
end
