class ImportsController < ApplicationController


  def index
  	@company =Company.all
  	end
  def new
  	@company =Company.all
  	# @import =Imports.new
    @payrollimport = PayrollImport.new
  end

  def create
    @payrollimport = PayrollImport.new(params[:import_file])
    # raise params.inspect
    if @payrollimport.save
      redirect_to imports_path
    else
      render :new
    end
  end
end
#   def import_
# end