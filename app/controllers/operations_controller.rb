class OperationsController < ApplicationController
  before_action :find_bank_account, only: [:index, :new, :create]
  before_action :set_operation, only: [:show, :edit, :update, :destroy]
  
  # GET /operations
  # GET /operations.json
  def index
    @operations = @bank_book.operations
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
    @operation  = Operation.find params[:id]
  end

  # GET /operations/new
  def new
    @operation = @bank_book.operations.build
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = Operation.new(operation_params)
    @operation.user = current_user
    @bank_book.operations << @operation
    respond_to do |format|
      if @bank_book.save
        format.html { redirect_to @operation, notice: 'Operation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @operation }
      else
        format.html { render action: 'new' }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1
  # PATCH/PUT /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation.destroy
    respond_to do |format|
      format.html { redirect_to operations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operation_params
      params[:operation].permit!
    end

    def find_bank_account
      @bank_book = BankBook.find params[:bank_book_id]
    end 
end
