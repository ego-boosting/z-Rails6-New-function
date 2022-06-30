class FavoritesController < ApplicationController
  before_action :book_params

  def create
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    # redirect_to request.referer
    # redirect_back(fallback_location: book_path(book))
  end



  def destroy
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    # redirect_to request.referer
    # redirect_back(fallback_location: book_path(book))
  end

  def book_params
    @book = Book.find(params[:book_id])
  end

end
