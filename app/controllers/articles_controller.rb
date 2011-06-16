class ArticlesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      flash[:success] = "Article created!!!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
    @article.destroy
    redirect_back_or root_path
  end
  
private
  
  def authorized_user
    @article = Article.find(params[:id])
    redirect_to root_path unless current_user?(@article.user)
  end
  
end