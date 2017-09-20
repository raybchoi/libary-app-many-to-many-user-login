class LibraryUsersController < ApplicationController
  # before anything runs it requires user to be logged in
  before_action :require_login
  # controls both the user / library - gives us easy access way to see things like all user memberships to a library
  def index
    @user = User.find(params[:id])
    # @libraries = User.find(params[:id]).libraries
    # go to this user and then go see all the libraries
    @libraries = @user.libraries
  end

  # when the user clicks on the join button within the library table it goes to library.find(id).users and pushes in the current_user. The .users is coming from the library model where it is "has_many :users current_user comes from the "session_helper.rb"


  def create

    @library = Library.find(params[:id])
    @library.users<<current_user
    redirect_to current_user

  end
end
