class FilmsController < ApplicationController
  # Here I want to see all of the films in the database
  get '/films' do
    # We're going to tell the controller what to do when it sees this request
    # Think about this as if I were in the rake console
    @films = Film.all

    # Then we need to tell it what view to show
    # erb is looking for a file path and so it is expecting a symbol
    erb :'/films/index' # '/views/films/index.erb'
  end

  # New and we will showcase the FORM to make something new
  get '/films/new' do
    @directors = Director.all
    erb :'/films/new'
  end

  post '/films' do
    binding.pry

    film =  Film.new(params["film"])
    film.save

    redirect to("/films/#{film.id}") #=> "/films/4"
  end

  get '/films/:id/edit' do
    # Look for the particular film
    @film = Film.find(params[:id])
    @directors = Director.all
    # render the edit form
    erb :'/films/edit'
  end

  patch '/films/:id' do
    film =  Film.find(params[:id])
    film.update(params["film"])


    redirect to("/films/#{film.id}")
  end

  delete '/films/:id' do
    film = Film.find(params[:id])
    film.destroy

    redirect to("/films")
  end

  # Here we are going to get a *specifc* item
  # We need to have the variable input so that way we can show
  # different things depending on the route
  get '/films/:id' do
    # We can also test what data is coming by using binding.pry still
    # binding.pry
    @film = Film.find(params[:id])
    erb :'/films/show'
  end













  #
end
