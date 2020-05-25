class Employee < ApplicationRecord
	belongs_to :company
	has_one :salary
end
