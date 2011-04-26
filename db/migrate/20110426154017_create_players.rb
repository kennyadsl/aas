class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :full_name
      t.string :occupation
      t.string :city
      t.string :role
      t.text :bio

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
