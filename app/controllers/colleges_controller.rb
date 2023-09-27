class CollegesController < ApplicationController
    def create
      college = College.new(college_params)

      if college.save
        render json: { message: 'College created successfully', college: college }, status: :created
      else
        render json: { errors: college.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def college_params
      params.require(:college).permit(:name, :location, :other_attribute)
    end
  end