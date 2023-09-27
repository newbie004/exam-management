class UsersController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        render json: { message: 'User created successfully', user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
          render json: { message: 'User updated successfully', user: user }
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :exam_id)
    end
end


  