class Salary < ApplicationRecord
	
	has_many :employeesalaries
	has_one :employee, through: :employeesalary
end
