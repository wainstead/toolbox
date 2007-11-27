class Notifier < ActionMailer::Base
  def signup_thanks(user)
    recipients user.email
    from "rails@test.myphotodevel.com"
    subject "Hello, sailor!"
    body :username => user.username, :password => user.password
  end
end
