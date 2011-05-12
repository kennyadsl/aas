class AddWhoIAmToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :who_i_am, :text
  end

  def self.down
    remove_column :players, :who_i_am
  end
end
