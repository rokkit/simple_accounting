class BankBooksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_bank_book, only: [:show, :edit, :update, :destroy]

  # GET /bank_books
  # GET /bank_books.json
  def index
    @bank_books = BankBook.all
  end

  # GET /bank_books/1
  # GET /bank_books/1.json
  def show
  end

  # GET /bank_books/new
  def new
    @bank_book = BankBook.new
  end

  # GET /bank_books/1/edit
  def edit
  end

  # POST /bank_books
  # POST /bank_books.json
  def create
    @bank_book = BankBook.new(bank_book_params)

    respond_to do |format|
      if @bank_book.save
        format.html { redirect_to @bank_book, notice: 'Bank book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bank_book }
      else
        format.html { render action: 'new' }
        format.json { render json: @bank_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_books/1
  # PATCH/PUT /bank_books/1.json
  def update
    respond_to do |format|
      if @bank_book.update(bank_book_params)
        format.html { redirect_to @bank_book, notice: 'Bank book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bank_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_books/1
  # DELETE /bank_books/1.json
  def destroy
    @bank_book.destroy
    respond_to do |format|
      format.html { redirect_to bank_books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_book
      @bank_book = BankBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_book_params
      params.require(:bank_book).permit(:id, :name, :bank_account, :total, :saldo)
    end
end
