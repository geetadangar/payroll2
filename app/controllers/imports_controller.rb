class ImportsController < ApplicationController

  def new
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