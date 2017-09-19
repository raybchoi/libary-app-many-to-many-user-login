class User < ApplicationRecord
  # this takes the password upon user.create and from the hash it looks for the key password and then it hits this line called 'has_secure_password'. This then calls in bcrypt to turn it into an encrypted password to save it
  has_secure_password
end
