class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  #@email_user=/emailAddress=(.+@.+)/.match(request.env["SSL_CLIENT_S_DN"])[1]
  
  #@page_title = "Hello #{@email_user}"
private

  
  def statusVPN(cmd)
    require 'socket'
    response = ""
    
    begin
      s = TCPSocket.open('localhost', 3001)
  
      s.puts cmd

      while line = s.gets 
        response += line.chop
      end

      s.close
    rescue Errno::ECONNREFUSED
      response = "Server do not connect"
    end
      
        
    case response
     when "true"
      flash[:vpn_status] = "VPN:on [OFF]"
      @status_vpn = "connect"
     when "false"
      flash[:vpn_status] = "VPN:off [ON]"
      @status_vpn = "disconnected"
     when "Thinking"
      flash[:vpn_status] = "Thinking"
      @status_vpn = "Thinking"
     when "Server do not connect"
      flash[:vpn_status] = "VPN:off [ON]"
      @status_vpn = "Server do not connect"
    else
      flash[:vpn_status] = "I do not know wath happened"
    end
    
    response
  end
  
end
