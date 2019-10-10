
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :'/articles/index'
  end

  get '/articles/new' do
    erb :'/articles/new'
  end

  post '/articles' do
    # binding.pry
    new_article = Article.create(params)
    # if params[:title] = " "
    #   erb  :"/articles/new"
    # else
    #   @article.save
      # article.update(params[:article])
    redirect "/articles/#{new_article.id}"
  end




  get '/articles/:id' do
    
    @article = Article.find(params[:id])
    erb :'/articles/show'
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb  :"/articles/edit"
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.title = params[:title]
    article.content = params[:content]
    article.save 
    redirect :"/articles/#{article.id}"
  end

  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect :"/articles"

  end



end
