class UsersController < ApplicationController
  
  def new
    @title = "Registration"
  end
  
  def show
    @user = User.find(params[:id])
  end

end
