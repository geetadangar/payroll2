class ImportsController < ApplicationController
before_action :authenticate_user!
  def index
  	@company =Company.all
    @payrollimport = PayrollImport.new
  end

  def new
  	# @company =Company.all
    @payrollimport = PayrollImport.new
  end

  def create
    import(file_params)
    # redirect_to new_import_path, notice: "file imported succesfully."
    redirect_to salaries_path, notice: "file imported succesfully."
  end

  # def show
  #   raise params.inspect
  #   @company = Company.find_by_id(params[:company_id])
  #   raise @company.inspect
  #   # @employees = @company.employees
  # end

  def import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(2)
    (3..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      Salary.file_save(row)
    end
  end

  def open_spreadsheet(file)
    case File.extname(params[:file].original_filename)
    when ".csv" then Csv.new(params[:file].path, nil, :ignore)
    when ".xls" then Roo::Excel.new(params[:file].path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(params[:file].path)
    else raise "Unknown file type: #{params[:file].original_filename}"
    end
  end

# workbook = Roo::Spreadsheet.open './sample_excel_files/xlsx_500_rows.xlsx'
# worksheets = workbook.sheets
# puts "Found #{worksheets.count} worksheets"

# worksheets.each do |worksheet|
#   puts "Reading: #{worksheet}"
#   num_rows = 0
#   workbook.sheet(worksheet).each_row_streaming do |row|
#     row_cells = row.map { |cell| cell.value }
#     num_rows += 1
#   end
#   puts "Read #{num_rows} rows" 






  def export

    # kit = PDFKit.new('http://localhost:3000/salaries')
    # file = kit.to_file('./payslip1.pdf')
    # send_file file


    kit = PDFKit.new(salary_url, page_size: 'A4')
    pdf = kit.to_pdf
    file = kit.to_file('./payslip.pdf')
    send_file file, type: 'application/pdf'
    # render :file => file
    # rendered_html = render_to_string("imports/show")
    # kit = PDFKit.new(salaries_url)
    # # kit = kit.to_file('employees/index')
    # pdf = kit.to_pdf
    # file = kit.to_file('./payslip.pdf')
    # send_file file, type: 'application/pdf'
  end
#   def send_email
#   @salar = Salary.find(params[:id])
#   pdf = render_to_string :pdf => 'payslip'
#   Sendpdf.send_report(@Salary, pdf).deliver
#   redirect_to salary_path(@salary)
#   flash[:notice] = 'Email has been sent!'
# end

  private

  def file_params
    params.permit(:file)
  end

end