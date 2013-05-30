require_relative '../config'

class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :id
      t.string :name
      t.string :email
      t.string :phone
    end
  end
end
