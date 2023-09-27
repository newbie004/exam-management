# app/models/user.rb
class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
  
    # Other validations and associations
  end
  