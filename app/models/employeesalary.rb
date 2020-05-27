class Employeesalary < ApplicationRecord
  belongs_to :employee
  belongs_to :salary
  belongs_to :company
end
