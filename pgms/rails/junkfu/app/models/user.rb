class User < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 30
end
