class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[show update destroy]

  # GET /wallets
  def index
    @wallets = Wallet.all
    render json: @wallets
  end

  # GET /wallets/1
  def show
    @wallet = Wallet.find(params[:id])
    @extracts = @wallet.extracts.order(created_at: :desc)
  
    render json: { wallet: @wallet, extracts: @extracts }
  end

  # POST /wallets
  def create
    @wallet = Wallet.new(wallet_params)

    if @wallet.save
      render json: @wallet, status: :created, location: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wallets/1
  def update
    if @wallet.update(wallet_params)
      render json: @wallet
    else
      render json: @wallet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wallets/1
  def destroy
    @wallet.destroy
    head :no_content
  end

  # POST /wallets/1/withdraw_or_deposit
  def withdraw_or_deposit
    @wallet = Wallet.find(params[:id])
    value = params[:value].to_f

    case params[:operation]
    when 'withdraw'
      if @wallet.amount >= value
        @wallet.amount -= value
        @wallet.save
        create_extract(value, 'withdraw')
        render json: { message: 'Withdrawal successful.' }
      else
        render json: { message: 'Insufficient funds for withdrawal.' }, status: :unprocessable_entity
      end
    when 'deposit'
      if value > 0
        @wallet.amount += value
        @wallet.save
        create_extract(value, 'deposit')
        render json: { message: 'Deposit successful.' }
      else
        render json: { message: 'Invalid deposit amount.' }, status: :unprocessable_entity
      end
    end
  end

  private

  def create_extract(value, type)
    @wallet.extracts.create(value: value, transaction_type: type)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_wallet
    @wallet = Wallet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def wallet_params
    params.require(:wallet).permit(:user_id, :amount)
  end
end