class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])

    @genre_books = Book.where(genre_id: @genre.id)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genres_path
    else
      render 'new'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to genre_path
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.destroy(params[:id])

    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:title, :description)
  end

end
