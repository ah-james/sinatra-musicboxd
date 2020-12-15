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
      flash[:error] = "ERROR: Please fill out all fields in the form."
      redirect '/signup'
    #elsif User.find_by_email(params[:email])
    elsif User.find(params[:email])
      flash[:login] = "There is already an account associated with that email, please Log In to your account!"
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
      flash[:signup] = "We can't find you in our database, please try again or sign up for a new account!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end
