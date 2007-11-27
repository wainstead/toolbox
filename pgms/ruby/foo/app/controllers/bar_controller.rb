class BarController < ApplicationController

  def index
    @bar = Bar.find(1)
  end
end
