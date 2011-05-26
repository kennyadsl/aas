RailsAdmin.config do |config|
  begin
    config.model Player do
      object_label do
        "#{bindings[:object].full_name}"
      end
      edit do
        field :full_name
        field :role
        field :occupation
        field :bio
        field :who_i_am
        field :website
        field :is_mister
        field :paperclip
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

  rescue
    # making sure it doesn't prevent the initial rake db:migrate from working
  end
end

