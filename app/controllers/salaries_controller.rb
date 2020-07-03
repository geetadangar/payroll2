class SalariesController < ApplicationController
	def index
		@salary = Salary.all
	end
end
