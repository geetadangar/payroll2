class Salary < ApplicationRecord
	# belong_to :employees
	# has_many :employees
	has_many :employeesalaries
	has_many :employees, through: :employeesalaries
	# has_many :employees, through: :employees_salaries
end
