class EmployeeMailer < ApplicationMailer
  default from: 'Payslip'
  layout 'mailer'

  def send_pdf_email(employee = nil, email = nil)
    employee = employee
    email = email
    mail(to: email, subject: 'welcome to payslip.')
    # attachments['payslip.pdf'] = File.read('/public/payslip.pdf')
    attachments.inline['image.jpg'] = File.read('/public/image.jpg')
  end
end
