class AllocatorController < ApplicationController
    def allocate_exam
      user_data = user_params
      invalid_params = validate_params(user_data)

      if(invalid_params.length != 0)
        render json: { errors: "Invalid data types for: #{invalid_params.join(', ')}" }, status: :bad_request
        return
      end

      result = ::ExamAllocatorService.new(user_data).allocate
      
      if result[:success]
        render json: { message: result[:message] }, status: :ok
      else
        render json: { errors: result[:error] }, status: :bad_request
      end

    end
  
    private
  
    def user_params
        params.require(:allocator).permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)

    end
  
    def validate_params(data)
        AllocateExamsParamsValidator.new(data).invalid_data_types
    end
end
  

  