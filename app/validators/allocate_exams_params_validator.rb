# app/validators/allocate_exams_validator.rb
class AllocateExamsParamsValidator 

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def invalid_data_types

    invalid_params = []

    invalid_params << 'first_name' unless data[:first_name].is_a?(String)
    invalid_params << 'last_name' unless data[:last_name].is_a?(String)
    invalid_params << 'phone_number' unless data[:phone_number].is_a?(String) && data[:phone_number] =~ /\A\d{3}-\d{3}-\d{4}\z/
    invalid_params << 'college_id' unless data[:college_id].is_a?(Integer)
    invalid_params << 'exam_id' unless data[:exam_id].is_a?(Integer)
    invalid_params << 'start_time' unless data[:start_time].is_a?(String)

    invalid_params
  end

end
  