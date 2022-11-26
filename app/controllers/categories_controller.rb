class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    user = current_user
    @categories = user.categories.all.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:customer_id, :name, :icon)
  end
end
