class Person < ActiveRecord::Base
  has_many :addresses
  validates_presence_of :email
end
