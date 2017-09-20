class Library < ApplicationRecord
  # many to many relationship with the library_users as the middle table
  has_many :library_users, dependent: :destroy
  has_many :users, through: :library_users
end
