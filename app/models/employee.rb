class Employee < ApplicationRecord
	 belongs_to :company
	 # belongs_to :salary
	# has_many :salaries
	# has_one :salary
	# has_many :salaries, through: :employees_salaries
	has_many :employeesalaries
	has_many :salaries, through: :employeesalaries

end
