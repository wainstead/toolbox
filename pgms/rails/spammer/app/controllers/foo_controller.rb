class FooController < ApplicationController

  def index
    @user = User.find_by_username('swain')
    @message =  "hello, sailor!"
    Notifier.deliver_signup_thanks(@user)
  end

end
