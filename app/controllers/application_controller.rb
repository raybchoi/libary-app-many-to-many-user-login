class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #  this allows us to use the helpers taht we created in the sessions_helper.rb
  include SessionsHelper
end
