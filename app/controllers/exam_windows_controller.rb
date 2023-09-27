class ExamWindowsController < ApplicationController
    def create
      exam_window = ExamWindow.new(exam_window_params)

      if exam_window.save
        render json: { message: 'Exam window created successfully', exam_window: exam_window }, status: :created
      else
        render json: { errors: exam_window.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def exam_window_params
      params.require(:exam_window).permit(:exam_id, :start_time, :end_time)
    end
end