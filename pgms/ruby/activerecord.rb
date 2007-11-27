#!/usr/local/bin/ruby

# $Id: activerecord.rb,v 1.1 2007/07/30 16:32:45 swain Exp $

# example of connecting to the DB with ActiveRecord in a standalone script.

require "rubygems"
require_gem "activerecord"

#puts "Hello, sailor!"

ActiveRecord::Base.establish_connection(
                                        :adapter => "mysql",
                                        :host => "localhost",
                                        :database => "myphotopro_development")

class Photographer < ActiveRecord::Base
end

photog = Photographer.find(1163)
photog.company_name = "Happy Returns Wedding Photography"
photog.save
