class News < ActiveRecord::Base
  attr_accessible :body, :link
  
  link_regex = /\A(^\z|http:\/\/+.+)\z/i #empty or valid link
  
  validates :body, :presence => true
  
  validates :link, :format => {:with => link_regex}
end
