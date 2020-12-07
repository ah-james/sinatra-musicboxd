class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
    @posts = Post.all
    erb :"/posts/index.html"
  end

  # GET: /posts/new
  get "/posts/new" do
    erb :"/posts/new.html"
  end

  # POST: /posts
  post "/posts" do
    @post = Post.create(params)
    redirect "/posts/#{@post.id}"
  end

  # GET: /posts/5
  get "/posts/:id" do
    @post = Post.find_by_id(params)
    erb :"/posts/show.html"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    @post = Post.find_by_id(params)
    erb :"/posts/edit.html"
  end

  # PATCH: /posts/5
  patch "/posts/:id" do
    @post = Post.find_by_id(params)
    
    @post.save
    redirect "/posts/:id"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
    @post = Post.find_by_id(params)
    @post.delete
    redirect "/posts"
  end
end
