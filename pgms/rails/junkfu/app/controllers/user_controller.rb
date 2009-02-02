class UserController < ApplicationController

  def index
    @users = User.paginate :page => params[:page], :order => 'lastname, firstname'
    logger.info("got this many users: #{@users.length}")
  end

end
