require_relative '../config'

class UpdateStudents < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.references :teacher
    end
    Student.update_all(:teacher_id => (1..18).to_a.sample)
  end
end
