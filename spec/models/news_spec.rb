require 'spec_helper'

describe News do
  
  before(:each) do
    @attr = { :body => "Quisque eget odio ac lectus vestibulum faucibus eget in metus.", :link => "http://www.test.it" }
  end
  
  it "should require a body" do
    no_body_news = News.new(@attr.merge(:body => ""))
    no_body_news.should_not be_valid
  end
  
  it "should not require a link" do
    no_link_news = News.new(@attr.merge(:link => ""))
    no_link_news.should be_valid
  end
  
  it "should save link with http://" do
    http_link_news = News.new(@attr.merge(:link => "http://www.cippa.com"))
    http_link_news.should be_valid
  end
  
  # I'm adding http:// before validate!
  it "should save link without http://" do
    no_http_link_news = News.new(@attr.merge(:link => "www.cippa.com"))
    no_http_link_news.should be_valid
  end
  
  it "should not save link with only http://" do
    only_http_link_news = News.new(@attr.merge(:link => "http://"))
    only_http_link_news.should_not be_valid
  end
  
end
