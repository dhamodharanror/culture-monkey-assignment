class Employee < ApplicationRecord
  belongs_to :department, optional: true


  def department_name
    department&.name
  end
end
