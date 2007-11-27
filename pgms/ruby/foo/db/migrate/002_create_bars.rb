class CreateBars < ActiveRecord::Migration
  def self.up
    create_table :bars do |t|
    end
  end

  def self.down
    drop_table :bars
  end
end
