require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book, "with all attributes properly set" do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :author => "value for author",
      :rating => 9.99,
      :synopsis => "value for synopsis"
    }
  end

  it "should create a new instance given valid attributes" do
    lambda { Book.create!(@valid_attributes) }.should_not raise_error
  end
end

describe Book, "missing rating and synopsis" do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :author => "value for author"
    }
  end

  it "should be OK, since rating and synopsis are optional" do
    lambda { Book.create!(@valid_attributes) }.should_not raise_error
  end
end

describe Book, "missing author" do
  before(:each) do
    @invalid_attributes = {
      :title => "value for title",
      :rating => 9.99,
      :synopsis => "value for synopsis"
    }
  end

  it "should not be allowed, because author is mandatory" do
    # lambda { Book.create!(@invalid_attributes) }.should raise_error <= this is another way to do it ;)
    book = Book.create(@invalid_attributes)
    book.errors_on(:author).should_not be_empty
  end
end

describe Book, "missing title" do
  before(:each) do
    @invalid_attributes = {
      :author => "value for author",
      :rating => 9.99,
      :synopsis => "value for synopsis"
    }
  end

  it "should not be allowed, because title is mandatory" do
    # lambda { Book.create!(@invalid_attributes) }.should raise_error  <= this is another way to do it ;)
    book = Book.create(@invalid_attributes)
    book.errors_on(:title).should_not be_empty
  end
end

