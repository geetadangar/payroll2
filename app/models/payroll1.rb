class Payroll1 < ApplicationRecord
	has_many :employees
    has_many :salaries
end
