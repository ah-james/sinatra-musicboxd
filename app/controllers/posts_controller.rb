class PostsController < ApplicationController

  get "/posts" do #index action
    @posts = Post.all
    erb :"/posts/index"
  end

  get "/posts/new" do # new action
    erb :"/posts/new"
  end

  post "/posts" do # create action
    @post = Post.create(params)
    redirect "/posts/#{@post.id}"
  end

  get "/posts/:id" do #show action
    @post = Post.find_by_id(params)
    erb :"/posts/show"
  end

  get "/posts/:id/edit" do #edit action
    @post = Post.find_by_id(params)
    erb :"/posts/edit"
  end

  patch "/posts/:id" do #update action
    @post = Post.find_by_id(params)
    
    @post.save
    redirect "/posts/:id"
  end

  delete "/posts/:id/delete" do #delete action
    @post = Post.find_by_id(params)
    @post.delete
    redirect "/posts"
  end
end
