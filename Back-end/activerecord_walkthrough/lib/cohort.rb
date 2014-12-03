class Cohort < ActiveRecord::Base
  has_many :students, dependent: :destroy
  def info
    "#{name} : #{students.length} student(s)"
  end
end
