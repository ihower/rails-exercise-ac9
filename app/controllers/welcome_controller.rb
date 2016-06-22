class WelcomeController < ApplicationController

  def index
  end

  def something
    respond_to do |format|
      format.html {
        render :text => "<h3>AWESOME!!! #{Time.now}</h3>"
      }
      format.js  # something.js.erb
    end

  end

end
