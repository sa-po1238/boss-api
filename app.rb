require "bundler/setup"
Bundler.require
require "sinatra/reloader" if development?
require "json"
require "httparty"

get '/' do
  erb :index
end
