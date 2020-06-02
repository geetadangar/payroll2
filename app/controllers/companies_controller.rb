class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

	def index
	 @company = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company= Company.new(company_params)
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

	def show
   @company = Company.find_by_id(params[:id])
	end

  def edit
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
    respond_to do |format|
      if @company.destroy
        format.html { redirect_to @company, notice: 'company was successfully destroyed.' }
      end
    end
  end

  private

    def set_company
      # raise params.inspect
      @company = Company.find(params[:id])
    end

    def company_params
       params.permit(:name,:address,:cin,:phone,:website,:Email_id)
    end
end