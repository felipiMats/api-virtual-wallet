class ExtractsController < ApplicationController
  before_action :set_extract, only: %i[show update destroy]

  # GET /extracts
  def index
    @extracts = Extract.all
    render json: @extracts
  end

  # GET /extracts/1
  def show
    @wallet = Wallet.find(params[:id])
    @extracts = @wallet.extracts
    render json: @extracts
  end

  # POST /extracts
  def create
    @extract = Extract.new(extract_params)

    if @extract.save
      render json: @extract, status: :created, location: @extract
    else
      render json: @extract.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /extracts/1
  def update
    if @extract.update(extract_params)
      render json: @extract
    else
      render json: @extract.errors, status: :unprocessable_entity
    end
  end

  # DELETE /extracts/1
  def destroy
    @extract.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_extract
    @extract = Extract.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def extract_params
    params.require(:extract).permit(:user_id, :value, :transaction_type)
  end
end