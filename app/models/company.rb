class Company < ApplicationRecord
	has_many :employees
	has_many :employeesalaries
	# has_many :salaries, through: :employeesalaries
	# has_many :employees, through: :employeesalaries
end
