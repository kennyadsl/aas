class AddImageToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :image, :string
  end

  def self.down
    remove_column :players, :image
  end
end
