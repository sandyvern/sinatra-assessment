class FerretsController < ApplicationController

  get '/ferrets' do
    if logged_in?
      @ferrets = Ferret.all
      erb :'ferrets/ferrets'
    else
      redirect to '/login'
    end
  end

  get '/ferrets/new' do
    if logged_in?
      erb :'ferrets/add_ferret'
    else
      redirect to '/login'
    end
  end

  post '/ferrets' do
    if params[:content] == ""
      redirect to "/ferrets/add_ferret"
    else
      @ferret = current_user.ferrets.create(content: params[:content])
      redirect to "/ferrets/#{@ferret.id}"
    end
  end

  get '/ferrets/:id' do
    if logged_in?
      @ferret = Ferret.find_by_id(params[:id])
      erb :'ferrets/show_ferret'
    else
      redirect to '/login'
    end
  end

  get '/ferrets/:id/edit' do
    if logged_in?
      @ferret = Ferret.find_by_id(params[:id])
      if @ferret.user_id == current_user.id
       erb :'ferrets/edit_ferret'
      else
        redirect to '/ferrets'
      end
    else
      redirect to '/login'
    end
  end

  patch '/ferrets/:id' do
    if params[:content] == ""
      redirect to "/ferrets/#{params[:id]}/edit"
    else
      @ferret = Ferret.find_by_id(params[:id])
      @ferret.content = params[:content]
      @ferret.save
      redirect to "/ferrets/#{@ferret.id}"
    end
  end

  delete '/ferrets/:id/delete' do
    if logged_in?
      @ferret = Tweet.find_by_id(params[:id])
      if @ferret.user_id == current_user.id
        @ferret.delete
        redirect to '/ferrets'
      else
        redirect to '/ferrets'
      end
    else
      redirect to '/login'
    end
  end
end
