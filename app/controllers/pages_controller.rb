class PagesController < ApplicationController
  def home
    @player = Player.random
    @news = News.all(:limit => 5)
  end

  def about
  end

end
