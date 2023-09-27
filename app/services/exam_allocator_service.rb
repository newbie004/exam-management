class ExamAllocatorService
    attr_reader :data
    def initialize(data)
      @data = data
    end
  
    def allocate
      college = College.find_by(id: data[:college_id])
      return { error: "College not found" } if college.nil?

      exam = college.exams.find_by(id: data[:exam_id])
      return { error: "Exam not found or doesn't belong to the college" } if exam.nil?

      user = User.where(first_name: data[:first_name], last_name: data[:last_name], phone_number: data[:phone_number]).first_or_create

      return {error: "User could be found or created"} if user.nil?

      allocate_exam(user, exam) # allocating exam to user 

      return { error: "Start time is not within the exam's time window. Available exam window is " } unless exam_time_window_valid?(exam)
  
      { success: true, message: "Exam allocated successfully and Start time lies within the exam's window" }

    end
  
    private
  
    def exam_time_window_valid?(exam)
      start_time = Date.parse(data[:start_time])
      exam_window = exam.exam_window

      return start_time >= exam_window.start_time && start_time <= exam_window.end_time
    end

    def allocate_exam(user, exam)
      # Assign the exam to the user by updating the exam_id attribute
      user.update(exam_id: exam.id)
    end
    
  end
  