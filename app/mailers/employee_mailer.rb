class EmployeeMailer < ApplicationMailer
  
  default from: 'Payslip'
  layout 'mailer'
  # def send_pdf_email(employee = nil, email = nil)
  # 	def new_order_email
  #   @salary = params[:salary]

  #   mail(to: <ADMIN_EMAIL>, subject: "You got a new order!")
  # # end
  #   employee = employee
  #   email = email
  #   attachments.inline["get-started.png"] = File.read("#{Rails.root}/app/assets/images/get-started.png")
  #   mail(to: email, subject: 'welcome to payslip.')
  
  # def send_report(salary, pdf)
  # @salary = salary
  # attachments['MyPDF.pdf'] = pdf
  # mail(:to => salary.email, :subject => "awesome pdf, check it")
  # end
	# def send_salary_mail
	# 	@mail = mail
	# 	@salary = salary
	# 	attachments['payslip.pdf'] = pdf.to_pdf
	# 	mail(to: "geetadangar999@gmail.com", from:"geeta@complitech.net", subject: "testingmail",message: "hiii")
	# end
	def send_pdf_email(email = nil, salary = nil, pdf = nil)
    @email = email
    @salary = salary
    attachments['payslip.pdf'] = pdf.to_pdf
    # mail(to: @email, subject: 'welcome to payslip.')
    mail(to: "geetadangar999@gmail.com", from:"geeta@complitech.net", subject: "testingmail",message: "hiii")

  end
end