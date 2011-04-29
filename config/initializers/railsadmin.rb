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
      field :title
      field :body, :text do
        ckeditor true
      end
      field :opponent
      field :date
      field :location
      field :is_indoor
      field :result_home
      field :result_guest
    end
    list do
      field :title
      field :opponent
      field :location
    end
  end

  config.model Picture do
    list do
      field :title
    end
  end
end