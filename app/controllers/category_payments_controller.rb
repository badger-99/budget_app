class CategoryPaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category_payment = CategoryPayment.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @category_payment = CategoryPayment.new(payment_params)

    if @category_payment.save
      redirect_to payments_path, notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:category_id, :payment_id)
  end
end
