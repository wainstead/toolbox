# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 2) do

  create_table "addresses", :force => true do |t|
    t.column "person_id", :integer
    t.column "address",   :string
    t.column "city",      :string
    t.column "state",     :string
    t.column "zip",       :integer
  end

  create_table "people", :force => true do |t|
    t.column "email",      :string
    t.column "first_name", :string
    t.column "last_name",  :string
  end

end
