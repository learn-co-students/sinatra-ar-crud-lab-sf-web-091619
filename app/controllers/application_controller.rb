
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :'index'
  end

  get '/articles/new' do
    erb :'new'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :'show'
  end

  post '/articles' do
    new_article = Article.create(params)
    redirect :"/articles/#{new_article.id}"
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :'edit'
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    updated_article = article.update(params[:article])
    redirect :"/articles/#{updated_article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    Article.delete(@article)
  end
end
