require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooksController do
  it "should have an action that allow the creation of new books" do
    controller.should respond_to(:create)
  end
end

describe BooksController, "creating a valid book" do
  before(:each) do
    @params_for_save = { "title" => "advanced joseki", "author" => "honinbou shusaku" }
    @book = mock_model(Book, :save! => true)
    Book.stub!(:new).and_return(@book)
  end

  def call_create
    post :create, { :book => @params_for_save }
  end

  it "should instantiate a new book with the given parameters" do
    Book.should_receive(:new).with(@params_for_save).and_return(@book)
    call_create
  end
end

