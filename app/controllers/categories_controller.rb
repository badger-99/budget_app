class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.where(user_id: current_user.id)
    @payments = Payment.joins(:category_payments)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to home_path, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
