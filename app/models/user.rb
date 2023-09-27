# app/models/user.rb
class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    belongs_to :exam, optional: true
    # Other validations and associations
end



# {
#     "user": {
#         "first_name": "Atlee",
#         "last_name": "Gupta",
#         "phone_number": "123456"
#     }
# }
  