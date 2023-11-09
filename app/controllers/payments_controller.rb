class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.joins(:category_payments).where(category_payments: { category_id: @category.id })
      .order(created_at: :desc)
  end

  def new
    @payment = Payment.new
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @categories = Category.where(user_id: current_user.id)
    success = false
    unless params[:category_ids].nil?
      category = Category.find(params[:category_id])
      @payment = Payment.new(payment_params)
      category_ids = params[:category_ids]

      if @payment.save
        category_ids.each do |category_id|
          @category_payment = CategoryPayment.new(category_id: category_id, payment_id: @payment.id)
          success = true if @category_payment.save
        end
      end
    end

    if success
      flash[:notice] = 'Category payment was successfully created.'
      redirect_to "/categories/#{category.id}/payment"
    else
      @payment = Payment.new
      render :new, status: :unprocessable_entity, locals: { payment: @payment }
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :author_id)
  end

  def category_payment_params
    params.require(:category_payment).permit(:payment_id, category_ids: [])
  end
end
