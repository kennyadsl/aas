class Picture < ActiveRecord::Base

  belongs_to :event
  
  attr_accessible :event_id, :title

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

end
