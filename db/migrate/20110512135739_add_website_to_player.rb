class AddWebsiteToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :website, :string
  end

  def self.down
    remove_column :players, :website
  end
end
