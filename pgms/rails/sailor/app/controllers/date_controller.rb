class DateController < ApplicationController
  def index
    @message = "You need a date!"
    @files = Dir.glob('/Users/swain/Sites/projects/*')
  end


  def need
    @message = "Need a date, sailor boy?"
  end
end
