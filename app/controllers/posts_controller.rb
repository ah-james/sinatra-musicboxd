class PostsController < ApplicationController

  get "/posts" do #index action
    @user = User.find_by_id(session[:user_id])
    @posts = Post.all
    erb :"/posts/index"
  end

  get "/posts/new" do # new action
    erb :"/posts/new"
  end

  post "/posts" do # create action
    login_check
    if params[:artist] == "" || params[:album] == ""
      flash[:missing] = "Please fill out the Artist and Album fields, you can come back later for the Score and Review!"
      redirect '/posts/new'
    else
      @post = Post.new(:artist => params[:artist], :album => params[:album], :score => params[:score], :review => params[:review])
      @post.user_id = session[:user_id]
      @post.save
      redirect "/posts/#{@post.id}"
    end
  end

  get "/posts/:id" do #show action
    @post = Post.find_by_id(params[:id])
    erb :"/posts/show"
  end

  get "/posts/:id/edit" do #edit action
    login_check
    @post = Post.find_by_id(params[:id])
    erb :"/posts/edit"
  end

  patch "/posts/:id" do #update action
    login_check
    @post = Post.find_by_id(params[:id])
    @post.album = params[:album]
    @post.artist = params[:artist]
    @post.score = params[:score]
    @post.review = params[:review]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  delete "/posts/:id/delete" do #delete action
    login_check
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect "/posts"
  end
end
