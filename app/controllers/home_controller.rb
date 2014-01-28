class HomeController < ApplicationController
  def index
     
     #@email=/emailAddress=(.+@.+)/.match(request.env["SSL_CLIENT_S_DN"])[1]
    statusVPN "status"
     
    respond_to do |format|
      format.html
    end
     
  end
end
