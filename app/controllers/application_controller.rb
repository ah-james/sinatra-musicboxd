require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "session"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id])
    end
  end
end
