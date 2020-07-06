class SalariesController < ApplicationController
	def index
		@salary = Salary.all
	end
	def send_mail
	salary.send_salary_mail.deliver_now!
	end
	def show
    @salary = Salary.find_by_id(params[:id])
  end
end
