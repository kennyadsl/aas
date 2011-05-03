class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_sidebar

  def load_sidebar
    @random_player = Player.random
    @news = News.all(:limit => 3)
    @sidebar = true
  end

end
