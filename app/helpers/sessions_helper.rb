module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end
    # Note that we've added @current_user instance variable and current_user method. This is so we can look up the logged in user from the session later, like in views.

  def current_user
    # if @current_user is nil or false set current_user it be equal to User.find_by_id(session[:user_id])
    @current_user ||= User.find_by_id(session[:user_id])
  end
end

# ||= OPERATOR which means: or assign this value to a variable. So if you did something like x ||= y this means
  # x || x = y so if x is nil or false set x to be the value of y.
