class Salary < ApplicationRecord
	serialize :salary_details, Hash
	# attr_accessor :salary_details

	# has_many :employeesalaries
	# has_one :employee, through: :employeesalary

	def self.file_save(row)
		salary = Salary.new
		salary.salary_details = row
		# salary.attributes = row.to_hash.slice(*Salary.accesible_attributes)
		salary.save!
	end
end
