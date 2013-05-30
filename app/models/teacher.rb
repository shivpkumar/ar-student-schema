require_relative '../../db/config'
require 'date'
require 'faker'

class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :students

  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,
    :message => "Must have valid email address" }
  validates :email, :uniqueness => true
  validate :phone_number_has_ten_digits_or_more

  def phone_number_has_ten_digits_or_more
    if phone.gsub(/\D/, "").split('').count < 10
      errors.add(:phone_num, "Must have at least 10 digits")
    end
  end
end
