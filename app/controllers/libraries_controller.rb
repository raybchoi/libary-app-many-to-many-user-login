class LibrariesController < ApplicationController
  before_action :require_login, except: [:index]
  # controls everything about the library
  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.create(library_params)
    redirect_to library_path(@library)
  end

  def show
    @library = Library.find(params[:id])
  end

  private
  def library_params
    # require => this is the key so for the library key, we allow the following 3
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end
end
