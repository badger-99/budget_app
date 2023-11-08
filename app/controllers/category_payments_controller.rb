class CategoryPaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category_payment = CategoryPayment.new
    @categories = Category.where(user_id: current_user.id)
    @payment = Payment.find(params[:payment_id])
    @category = Category.find(params[:category_id])
  end

  def create
    category = Category.find(params[:category_id])
    category_ids = params[:category_ids]
    success = true

    category_ids.each do |category_id|
      @category_payment = CategoryPayment.new(category_id:, payment_id: params[:payment_id])
      success = false unless @category_payment.save
    end

    if success
      flash[:notice] = 'Category payment was successfully created.'
      redirect_to "/categories/#{category.id}/payment"
    else
      flash[:error] = 'Failed to create the category payment.'
      render :new
    end
  end

  private

  def category_payment_params
    params.require(:category_payment).permit(:payment_id, category_ids: [])
  end
end
