class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.text :body
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
