class HelloController < ApplicationController
  def index
    @message = "Yow!  Legally-imposed CULTURE-reduction is CABBAGE-BRAINED!"
  end
  
  def say
    @message = "hello, sailor!"
  end
end
