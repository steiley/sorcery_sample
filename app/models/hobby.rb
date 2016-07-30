class Hobby < ActiveRecord::Base
  has_many :users_hobbies
  has_many :users, through: :users
end
