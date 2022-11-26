class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    @category = user.categories.find(params[:category_id])
    @deals = @category.deals.order(created_at: :desc)
  end

  def new
    customer = current_user
    @category = customer.categories.find(params[:category_id])
    @deal = Deal.new
    @other_categories = customer.categories.where.not(id: @category)
  end

  def create
    user = current_user
    @category = user.categories.find(params[:category_id])
    @deal = Deal.new(deal_params)
    @deal.author = current_user
    @other_categories = user.categories.where.not(id: @category)
    categories = Category.where(id: params[:category_ids])
    @deal.categories.push(categories)
    respond_to do |format|
      if @deal.save
        format.html { redirect_to category_deals_url(@category), notice: 'Transaction was successfully created.' }
        
      else
        format.html { redirect_to category_deals_url(@category), notice: 'Unprocessable transaction.' }
        
      end
    end
  end

  private 
  
  def deal_params
    params.require(:deal).permit(:author_id, :name, :amount, :category_id, category_ids: [])
  end

end