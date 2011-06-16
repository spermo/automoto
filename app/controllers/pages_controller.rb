class PagesController < ApplicationController
  def home
    @title = "Home"
    @user = User.find(1)
    @articles = @user.articles.paginate(:page => params[:page])
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def admin
    @title = "Admin"
    @article = Article.new
  end

end
