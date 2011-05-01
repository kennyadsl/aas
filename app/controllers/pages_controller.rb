class PagesController < ApplicationController
  def home
    @player = Player.random
    @news = News.find(:all, :limit => 5)
  end

  def about
  end

end
