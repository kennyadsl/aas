class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.string :opponent
      t.datetime :date
      t.string :email
      t.text :body
      t.string :location
      t.boolean :is_accepted

      t.timestamps
    end
  end

  def self.down
    drop_table :challenges
  end
end
