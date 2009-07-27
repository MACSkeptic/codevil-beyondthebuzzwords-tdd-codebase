class BooksController < ApplicationController
  def create
    @book = Book.new params[:book]
    @book.save!
    flash[:notice] = "The book was saved successfully"
    render :text => ""
  rescue
    flash[:notice] = "There was an error saving the book"
    render :text => ""
  end
end

