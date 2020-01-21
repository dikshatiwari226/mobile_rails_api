class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
    render json: @businesses
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    render json: @business
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    render json: @business
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
      if @business.save
        render json: { status: 200,  data: {business: @business} , message: "Business created" }
      else
        render json: { status: 401,  errors: @business.errors.full_messages }
      end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
      if @business.update(business_params)
        render json: { status: 200,  data: {business: @business} , message: "Business was successfully updated" }
      else
        render json: { status: 401,  errors: @business.errors.full_messages }
      end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    if @business.destroy
        render json: { status: 200,  data: {business: @business} , message: "Business was successfully destroyed." }
      else
        render json: { status: 401,  errors: @business.errors.full_messages }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:person_name, :business_name, :business_gst_number)
    end
end
