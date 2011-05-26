class Player < ActiveRecord::Base
  
  attr_accessible :full_name, :role, :occupation, :city, :bio, :who_i_am, :website, :is_mister

  website_regex = /\A(^\z|http:\/\/+.+)\z/i #empty or valid link

  validates :website, :format => { :with => website_regex }

  default_scope :order => 'full_name ASC'

  before_validation :add_http

     has_attached_file :paperclip,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.random
    if Player.count > 0
      Player.offset(rand(Player.count)).first
    end
  end

  private

  def add_http
    if self.website && !self.website.blank? & !self.website.match(/^http:\/\//)
      self.website = "http://"+self.website
    end
  end

end

