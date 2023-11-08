class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    category = Category.find(params[:category_id])

    if @payment.save
      redirect_to "/categories/#{category.id}/category_payment/#{@payment}/new"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def payment_params
    params.require(:payment).permit(:name, :amount, :author_id)
  end
end
