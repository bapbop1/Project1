class ProductsController < ApplicationController
  before_action :load_menu, :load_product

  def show
    @support = Supports::ProductSupport.new(@product)
    @comment = Comment.new
  end

  private

  def load_product
    @product = Product.find_by_id params[:id]
    return if @product
    flash[:danger] = t :not_found_product
    redirect_to root_path
  end
end
