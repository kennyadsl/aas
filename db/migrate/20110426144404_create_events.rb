class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.text :body
      t.datetime :date
      t.string :location
      t.string :opponent
      t.boolean :is_indoor
      t.integer :result_home
      t.integer :result_guest

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
