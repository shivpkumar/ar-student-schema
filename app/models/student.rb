require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,
    :message => "Must have valid email address" }
  validates :email, :uniqueness => true
  validates :age, :numericality => { :greater_than => 5 }
  validate :phone_number_has_ten_digits_or_more

  def phone_number_has_ten_digits_or_more
    if phone.gsub!(/\D/, "").split('').count < 10
      errors.add(:phone_num, "Must have at least 10 digits")
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def age
    if birthday.month < Date.today.month
      Date.today.year - birthday.year
    else
      Date.today.year - birthday.year - 1
    end
  end

end
