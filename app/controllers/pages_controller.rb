class PagesController < ApplicationController

  def home
    @title = t("pages.title.home")
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.page(params[:page])
    end
  end

  def contact
    @title = t("pages.title.contact")
  end
  
  def about
    @title = t("pages.title.about")
  end
  
  def help
    @title = t("pages.title.help")
  end
end
