class Player < ActiveRecord::Base
  
  attr_accessible :full_name, :role, :occupation, :city, :bio, :who_i_am, :website, :is_mister

  website_regex = /\A(^\z|http:\/\/+.+)\z/i #empty or valid link

  validates :website, :format => { :with => website_regex }

  before_validation :add_http

  if Rails.env.production?
    has_attached_file :paperclip,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :bucket => "abruzzoallstars",
                    :s3_credentials => {
                            :access_key_id => "AKIAJFHBWGJIURYW6MUQ",
                            :secret_access_key => "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"
                    }
    else
      has_attached_file :paperclip,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  end

  def self.random
    Player.offset(rand(Player.count)).first
  end

  private

  def add_http
    if self.website && !self.website.blank? & !self.website.match(/^http:\/\//)
      self.website = "http://"+self.website
    end
  end

end

