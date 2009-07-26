require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :author => "value for author",
      :rating => 9.99,
      :synopsis => "value for synopsis"
    }
  end

  it "should create a new instance given valid attributes" do
    Book.create!(@valid_attributes)
  end
end
