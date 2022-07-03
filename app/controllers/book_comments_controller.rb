class BookCommentsController < ApplicationController
  before_action :book_params

  def create
    # @book = Book.find(params[:book_id])
    # @book_comment = BookComment.new
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.save
    # redirect_to request.referer
    # redirect_to book_path(book)
  end

  def destroy
    # @book = Book.find(params[:book_id])
    # @book_comment = BookComment.new
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    # redirect_to request.referer
    # BookComment.find(params[:id]).destroy
    # redirect_to book_path(params[:book_id])
  end

  # comment = current_user.book_comments.new(book_comment_params)
  # comment = BookComment.new(book_comment_params)
  # comment.user_id = current_user.id



  private

    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end

    def book_params
      @book = Book.find(params[:book_id])
      @book_comment = BookComment.new
    end

end
