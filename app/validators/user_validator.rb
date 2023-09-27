# app/validators/user_validator.rb
class UserValidator < Dry::Validation::Contract
    params do
      required(:user).schema do
        required(:first_name).filled(:string)
        required(:last_name).filled(:string)
        required(:phone_number).filled(:string)
        optional(:exam_id).maybe(:integer)
      end
    end
  end
  