# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class SalaryMailerPreview < ActionMailer::Preview
def new_salary_email
    # Set up a temporary order for the preview
    salary = Salary.new( )

    SalaryMailer.with(salary: salary).new_salary_email
  end
end
