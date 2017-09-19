class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # What is User.confirm? It is something that we are adding to our User model as a custom model method. This will make your code more modular.

    # What the heck is this login(@user)? It's a method add to the helper methods for this controller.
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      # redirect_to @user same as redirect_to user_path(@user)
      redirect_to @user
    else
      redirect_to login_path
    end
  end
end
