class BooksController < ApplicationController
  def create
    @book = Book.new params[:book]
    render :text => ""
  end
end

