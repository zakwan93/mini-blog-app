require "sinatra"
require "sinatra/activerecord"
require 'sinatra/flash'


require_relative('models/user.rb')
require_relative('models/post.rb')
require_relative('models/profile.rb')

enable :sessions
set :session_secret, 'super secret'


get "/" do
  @post = Post.last(10)
  erb :index
end

get "/index" do
  @post = Post.last(10)
  erb :index 
end

get "/home" do
  @post = Post.all
  @user = User.find(session[:id]) 
  erb :home
end

get "/yourblog" do
  @user = User.find(session[:id])
   @post = Post.where(user_id: session[:id]).last(10)
   @user = session[:id]
   erb :yourblog
end

get "/signup" do
  erb :signup
end

post '/signup' do
   @user = User.create(fname: params[:fname],lname: params[:lname],username: params[:username],password: params[:password],age: params[:age])
   session[:id] = @user.id 
   redirect '/home'
end

get '/login' do
	erb :login
end

post "/login" do
  @user = User.find_by(username: params[:username],password: params[:password])
  if @user.nil?
  	flash[:alert] = "Wrong Username and Password"
  	redirect '/index'
  	else
  		session[:id] = @user.id 
  		redirect '/home'
end
end

get "/logout" do
	@user = User.find(session[:id])
	session.clear
	redirect '/index'
end

get "/editdetail" do
  @user = User.find(session[:id])
  erb :editdetail
end

put '/editdetail' do 
  @user = User.find(session[:id]) 
  @user.update(fname: params[:fname],lname: params[:lname],username: params[:username],password: params[:password],age: params[:age]) 
  @user.save 
  redirect '/home'
end

get "/deleteuser" do
  @user = User.find(session[:id])
  erb :deleteuser
end

delete '/deleteuser' do
	@user = User.find(session[:id])
   @post = Post.find_by(user_id: session[:id])
    @post.delete
    @user.delete
    redirect '/index'
end

get '/newblog' do
  @user = session[:id]
  erb :newblog
end


post '/newblog' do
  @user = session[:id]
   @post = Post.create(title: params[:title],content: params[:content],user_id: session[:id])
   
   redirect '/profile'
end

get '/profile' do
  @post = Post.where(user_id: session[:id])
  @user = User.find(session[:id])
  erb :profile
end

get "/deletepost" do
  @post = Post.where(post_id: session[:id])
  erb :deletepost
end

delete '/deletepost' do
  @post = Post.find_by(user_id: session[:id])
  @post.delete
  redirect '/home'
end


