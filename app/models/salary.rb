class Salary < ApplicationRecord
	serialize :salary_details, Array
	attr_accessor :salary_details

	has_many :employeesalaries
	has_one :employee, through: :employeesalary

	def self.file_save(row)
		salary = Salary.new
		salary.salary_details = row
		puts "\n\n\n\n\n\n===================================#{salary.inspect}"
		# salary.attributes = row.to_hash.slice(*Salary.accesible_attributes)
		salary.save!
	end
end
