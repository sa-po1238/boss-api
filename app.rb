require "bundler/setup"
Bundler.require
require "sinatra/reloader" if development?
require "json"
require "httparty"

get '/' do
  erb :index
end

get '/search' do
    keyword = params[:keyword]
    
    query = {term: keyword, country: 'jp', media: 'music', limit: 6}
    response = HTTParty.get('https://itunes.apple.com/search', query: query)
    
    returned_json = JSON.parse(response.body)
    
    @musics = returned_json['results']
    
    erb :result
end
