RailsAdmin.config do |config|
  config.model Player do
    object_label do
      "#{bindings[:object].full_name}"
    end
  end
  
  config.model Challenge do
    object_label do
      "#{bindings[:object].opponent}"
    end
  end
  
  config.model User do
    visible false
  end
  
  config.model Event do
    edit do
      field :body do
        ckeditor true
      end
    end
  end
end