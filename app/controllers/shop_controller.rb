class ShopController < ApplicationController

  def index
    @genres = Genre.all
    @latest_books = Book.order(created_at: :desc).limit(8)
    @top_rated_books = Book.order(rating: :desc).limit(8)
  end

  def list_books
    @books = Book.all
  end

  def list_authors
    @authors = Author.all
  end

  def list_genres
    @genres = Genre.all
  end

  def show_book
    @book = Book.find(params[:id])
  end

  def show_author
    @author = Author.find(params[:id])
    @author_books = Book.where(author_id: @author.id)
  end

  def show_genre
    @genre = Genre.find(params[:id])
    @genre_books = Book.where(genre_id: @genre.id)
  end

end
