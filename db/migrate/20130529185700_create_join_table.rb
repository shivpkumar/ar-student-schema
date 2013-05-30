require_relative '../config'

class CreateJoinTable < ActiveRecord::Migration
  def change
    remove_column :students, :teacher_id
  end
end
