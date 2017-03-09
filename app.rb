# app.rb
require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

before do
  #
end

helpers do
  #
end

not_found do
  "/"
end

get "/" do
  erb :home, layout: :layout
end

post "/save_message" do
  @message = params[:message]
  time = Time.now.strftime("%Y_%m_%d_%H_%M_%S")
  filename = File.new("public/messages/#{time}.txt", "w+")
  filename.puts(@message)
  filename.close
  redirect "/thanks"
end

get "/thanks" do
  erb :thanks
end
