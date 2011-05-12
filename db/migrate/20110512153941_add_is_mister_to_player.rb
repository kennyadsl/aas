class AddIsMisterToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :is_mister, :boolean
  end

  def self.down
    remove_column :players, :is_mister
  end
end
