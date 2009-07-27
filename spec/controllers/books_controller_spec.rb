require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooksController do
  it "should have an action that allow the creation of new books" do
    controller.should respond_to(:create)
  end
end

