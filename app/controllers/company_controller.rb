class CompanyController < ApplicationController
	before_action :set_company, only: [:show, :new, :edit, :update, :destroy]
	def index
	 @company = Company.all
	end

	def show
	   # @company = Company.find_by_id(params[:id])
	end
	def new
	  @company = Company.new
	end

	def edit
      @company = Company.find(params[:id])
  end
  def create
    # raise params.inspect
    @company= Company.new(company_params)
    # raise params.inspect
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end

  end
   def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to company_url, notice: 'company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   private
     def set_company
      @company = Company.find(params[:id])
    end
    def company_params
       params.permit(:name,:address,:cin,:phone,:website,:Email_id)
      # params.permit(:name, :discription)

    end

end
