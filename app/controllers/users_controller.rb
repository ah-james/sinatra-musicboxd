class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    @user = User.new(username: params["username"], email: params["email"], password_digest: params["password_digest"])
    @user.save
    session[:user_id] = @user.id
    redirect '/users/show'
  end

  get '/users/show' do
    @user = User.find(session[:user_id])
    erb :'/users/show'
  end
end
