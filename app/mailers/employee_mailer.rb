class EmployeeMailer < ApplicationMailer
  default from: 'Payslip'
  layout 'mailer'

  def send_pdf_email(employee = nil, email = nil)
    employee = employee
    email = email
    attachments.inline["get-started.png"] = File.read("#{Rails.root}/app/assets/images/get-started.png")
    mail(to: email, subject: 'welcome to payslip.')
  end
end