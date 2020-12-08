class UsersController < ApplicationController

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(username: params[:username], email: params[:email], password_digest: params[:password])
    @user.save
    session[:user_id] = @user.id
    redirect '/posts'
  end
end
