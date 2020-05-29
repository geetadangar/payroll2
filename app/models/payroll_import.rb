class PayrollImport < ApplicationRecord
  include ActiveModel::Model
  require 'roo'

    attr_accessor :file

    # def initialize(attributes={})
    #   attributes.each { |name, value| send("#{name}=", value) }
    # end

    # def persisted?
    #   false
    # end

    # def open_spreadsheet
    #   case File.extname(file.original_filename)
    #   when ".csv" then Csv.new(file.path, nil, :ignore)
    #   when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    #   when ".xlsx" then Roo::Excelx.new(file.path)
    #   else raise "Unknown file type: #{file.original_filename}"
    #   end
    # end

  def open_spreadsheet
    Roo::Excelx.new('./sample_payroll.xlsx', {:expand_merged_ranges => true})
  end

  def load_imported_salaries
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(2)
    (3..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      salary = Salary.new
      salary.salary_details = row.to_hash
      salary
  end

      # row = Hash[[header, spreadsheet.row(i)].transpose]
      # #   item = Item.find_by_id(row["id"]) || Item.new
      #   salary << row.to_hash

      # end
      # return salary, header

    end

  def imported_salaries
    @imported_salaries ||= load_imported_salaries
  end

    # def payroll
    #   @payroll ||= Payroll.new({'company': Company.new, 'for_month': (DateTime.now-1.month).strftime('%B, %Y'), 'salaries': imported_salaries})
    # end

  def save
    if imported_salaries.map(&:valid?).all?
      imported_salaries.each(&:save!)
      true
    else
      imported_salaries.each_with_index do |salary, index|
      salary.errors.full_messages.each do |msg|
        errors.add :base, "Row #{index + 6}: #{msg}"
      end
    end
      false
      end
    end

    # def index
    #     # @xlsx = Roo::Spreadsheet.open('./sample_payroll.xlsx')
    #     @xlsx, @header = load_imported_items


    #     #xlsx = Roo::Excelx.new("./new_prices.xlsx")

    #     # Use the extension option if the extension is ambiguous.
    #     #xlsx = Roo::Spreadsheet.open('./rails_temp_upload', extension: :xlsx)

    #     #xlsx.info
    #     # => Returns basic info about the spreadsheet file

    # end

    # def export
    #     kit = PDFKit.new('http://localhost:3000/payslip/show')
    #     file = kit.to_file('./payslip.pdf')
    #     send_file file
    #     # render :file => file
    # end

    # def load_imported_items
    #     spreadsheet = open_spreadsheet
    #     header = spreadsheet.row(2)
    #     salary = []
    #     (3..spreadsheet.last_row).map do |i|
    #       row = Hash[[header, spreadsheet.row(i)].transpose]
    #     #   item = Item.find_by_id(row["id"]) || Item.new
    #       salary << row.to_hash

    #     end
    #     return salary, header
    # end
end