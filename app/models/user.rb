class User < ApplicationRecord
  # this takes the password upon user.create and from the hash it looks for the key password and then it hits this line called 'has_secure_password'. This then calls in bcrypt to turn it into an encrypted password to save it
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    # ? : => tearny operater keeping us from trying to call @user.authenticate when the @user is nil.
    # the @user.authenticate comes from has_secure_password - http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
    @user ? @user.authenticate(params[:password]) : false
  end
end
