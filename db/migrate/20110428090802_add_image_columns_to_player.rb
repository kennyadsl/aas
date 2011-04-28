class AddImageColumnsToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :paperclip_file_name,    :string
    add_column :players, :paperclip_content_type, :string
    add_column :players, :paperclip_file_size,    :integer
    add_column :players, :paperclip_updated_at,   :datetime
  end

  def self.down
    remove_column :players, :paperclip_file_name
    remove_column :players, :paperclip_content_type
    remove_column :players, :paperclip_file_size
    remove_column :players, :paperclip_updated_at
  end
end
