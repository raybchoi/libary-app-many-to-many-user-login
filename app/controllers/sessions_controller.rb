class SessionsController < ApplicationController
  # controls the session for the user

  # render the new login screen
  def new
    @user = User.new
  end

  # create a session when a user logs in
  def create
    # What is User.confirm? It is something that we are adding to our User model as a custom model method. This will make your code more modular.

    # What the heck is this login(@user)? It's a method add to the helper methods for this controller.
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)
    if @user
      login(@user)
      # redirect_to @user same as redirect_to user_path(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  # destroy the session when you logout - creating a helper method logout
  def destroy
    logout
    # session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end



end
