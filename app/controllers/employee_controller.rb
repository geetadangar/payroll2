class EmployeeController < ApplicationController
  def index
	 @employee = Employee.all
	end

	def show
	   @employee = Employee.find_by_id(params[:id])
	end
	def new
	  @employee = Employee.new
	end

	def edit
      @employee = Employee.find(params[:id])
  end
  def create
    # raise params.inspect
    @employee= Employee.new(employee_params)
    # raise params.inspect
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end

  end
   def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employee_url, notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   private
     def set_employee
      @employee = Employee.find(params[:id])
    end
    def employee_params
       params.permit(:name,:designation,:department,:PAN,:PF)
      # params.permit(:name, :discription)

    end

end
