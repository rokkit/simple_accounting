class HttpRequestsController < ApplicationController
  before_action :set_http_request, only: [:show, :edit, :update, :destroy]

  # GET /http_requests
  # GET /http_requests.json
  def index
    @http_requests = HttpRequest.order("created_at").page(params[:page]).per(10)
  end

  # GET /http_requests/1
  # GET /http_requests/1.json
  def show
  end

  # GET /http_requests/new
  def new
    @http_request = HttpRequest.new
  end

  # GET /http_requests/1/edit
  def edit
  end

  # POST /http_requests
  # POST /http_requests.json
  def create
    @http_request = HttpRequest.new(http_request_params)

    respond_to do |format|
      if @http_request.save
        format.html { redirect_to @http_request, notice: 'Http request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @http_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @http_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /http_requests/1
  # PATCH/PUT /http_requests/1.json
  def update
    respond_to do |format|
      if @http_request.update(http_request_params)
        format.html { redirect_to @http_request, notice: 'Http request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @http_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /http_requests/1
  # DELETE /http_requests/1.json
  def destroy
    @http_request.destroy
    respond_to do |format|
      format.html { redirect_to http_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_http_request
      @http_request = HttpRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def http_request_params
      params.require(:http_request).permit(:method, :parameters, :ip_address)
    end
end
