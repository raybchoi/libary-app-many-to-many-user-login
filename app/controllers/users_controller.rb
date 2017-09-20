class UsersController < ApplicationController
  # controls the user information
  # In order to visit a users#show page, you have to be logged in. Use a special before_action to check for this. Set up a require_login session helper to make help keep the controller "skinny."
  before_action :require_login, except: [:index, :new]

  def index
    @users = User.all
  end
  def new
    # we make a new user
    # to pass to the form view later
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    redirect_to root_path
  end
  def show
    # find_by_id is looking for the PK in the DB
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
