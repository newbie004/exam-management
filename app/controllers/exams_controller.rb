class ExamsController < ApplicationController
    def create
      exam = Exam.new(exam_params)

      if exam.save
        render json: { message: 'Exam created successfully', exam: exam }, status: :created
      else
        render json: { errors: exam.errors.full_messages }, status: :unprocessable_entity
      end
    end


    def update
        exam = Exam.find(params[:id])

        if exam.update(exam_params)
          render json: { message: 'Exam updated successfully', exam: exam }
        else
          render json: { errors: exam.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private

    def exam_params
      params.require(:exam).permit(:name, :college_id)
    end
end