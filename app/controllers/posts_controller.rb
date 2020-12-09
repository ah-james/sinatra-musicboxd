class PostsController < ApplicationController

  get "/posts" do #index action
    # @user = User.find(session[:id])
    @posts = Post.all
    erb :"/posts/index"
  end

  get "/posts/new" do # new action
    erb :"/posts/new"
  end

  post "/posts" do # create action
    @post = Post.create(:artist => params[:artist], :album => params[:album], :score => params[:score], :review => params[:review])
    redirect "/posts/#{@post.id}"
  end

  get "/posts/:id" do #show action
    @post = Post.find_by_id(params[:id])
    erb :"/posts/show"
  end

  get "/posts/:id/edit" do #edit action
    @post = Post.find_by_id(params[:id])
    erb :"/posts/edit"
  end

  patch "/posts/:id" do #update action
    @post = Post.find_by_id(params[:id])
    @post.album = params[:album]
    @post.artist = params[:artist]
    @post.score = params[:score]
    @post.review = params[:review]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  delete "/posts/:id/delete" do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect "/posts"
  end
end
