class ChangeCollegeIdToNullableInExams < ActiveRecord::Migration[6.0]
  def change
    change_column :exams, :college_id, :integer, null: true
  end
end
