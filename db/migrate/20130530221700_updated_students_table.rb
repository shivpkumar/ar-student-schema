require_relative '../config'

class UpdatedStudentsTable < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.date :created_at, :updated_at
    end
  end
end
