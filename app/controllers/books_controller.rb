class BooksController < ApplicationController
  def create
    @book = Book.new params[:book]
    @book.save!
    flash[:notice] = "The book was saved successfully"
    render :text => ""
  end
end

