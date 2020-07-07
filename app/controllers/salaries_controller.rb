class SalariesController < ApplicationController
	def index
		@salary = Salary.all
	end
	def send_email
    @salary = Salary.find_by_id(params[:id])
    @email =  @salary.salary_details["email"]
    @pdf = PDFKit.new(salary_url, page_size: 'A4')
    EmployeeMailer.send_pdf_email(@email, @salary, @pdf).deliver_now!
  end
	def show
    @salary = Salary.find_by_id(params[:id])
  end
end
