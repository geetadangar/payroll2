class CompanyController < ApplicationController
	def index
	@company = Company.all
	end
end
