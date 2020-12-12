class UsersController < ApplicationController

  get "/users" do #index action
    @users = User.all
    erb :"/users/index"
  end

  get "/users/:id" do #show action
    @user = User.find_by_id(params[:id])
    @posts = Post.all
    erb :"/users/show"
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/posts'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      user.save
      session[:user_id] = user.id
      redirect '/posts'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/posts"
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end
