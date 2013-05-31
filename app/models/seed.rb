require_relative 'teacher'
require_relative 'student'

10.times do
  Teacher.create :name => Faker::Name.name,
                 :email => Faker::Internet.email,
                 :phone => Faker::PhoneNumber.phone_number
end

100.times do
  Student.create  :first_name => Faker::Name.name,
                  :last_name => Faker::Name.name,
                  :birthday => Date.new(1980,10,23),
                  :gender => ['male','female'].sample,
                  :email => Faker::Internet.email,
                  :phone => Faker::PhoneNumber.phone_number,
                  :created_at => DateTime.now,
                  :updated_at => DateTime.now
end

# teacher = Teacher.find(3)
# stud = Student.find(55)
# p stud
# puts

# teacher.students << stud
# p stud

# teacher = Teacher.find(6)

# Student.find(5).teachers << teacher

1.upto(100) do |x|
  rand_num = (1..10).to_a.sample 
  Student.find(x).teachers << Teacher.find(rand_num)
end
