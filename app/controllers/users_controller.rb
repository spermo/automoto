class UsersController < ApplicationController
  
  def new
    @title = "Registration"
    @user  = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end

  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Automoto!"
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
   end
   
end
