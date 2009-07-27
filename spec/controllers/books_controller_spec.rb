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

  it "should save the book on the database" do
    @book.should_receive(:save!).and_return(true)
    call_create
  end

  it "should notice the user about the success" do
    call_create
    flash.now[:notice].should match(/.*successfully.*/)
  end
end

describe BooksController, "creating an invalid new book" do
  before(:each) do
    @params_for_save = { "title" => "the god delusion", "author" => "richard dawkins" }
    Book.stub!(:new).and_return(@book = mock_model(Book, :save! => true))
  end

  def call_create
    post :create, { :book => @params_for_save }
  end

  it "should instantiate a new book with the given parameters" do
    Book.should_receive(:new).with(@params_for_save).and_return(@book)
    call_create
  end

  it "should notice the user that the book is invalid" do
    @book.should_receive(:save!).and_raise(StandardError.new("Error saving the book"))
    call_create
  end

  it "should notice the user about the failure" do
    @book.should_receive(:save!).and_raise(StandardError.new("Error saving the book"))
    call_create
    flash.now[:notice].should match(/.*error.*/)
  end
end

