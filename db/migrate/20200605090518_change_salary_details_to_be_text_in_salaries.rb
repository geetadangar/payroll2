class ChangeSalaryDetailsToBeTextInSalaries < ActiveRecord::Migration[6.0]
  def change
    change_column :salaries, :salary_details, :text
  end
end
