class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :person_id, :int
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :int
    end
  end

  def self.down
    drop_table :addresses
  end
end
