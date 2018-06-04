class CartsController < ApplicationController
  before_action :product_params_id
  before_action :cart_user, only: [:index]

  def index; end

  def add_to_cart
    respond_to do |format|
      session[:cart] = {} unless session[:cart]
      cart = session[:cart]
      cart[@id] = cart[@id] ? (cart[@id].to_i + 1) : 1
      session_cart
      format.js
    end
  end

  def destroy
    respond_to do |format|
      cart = session[:cart]
      cart.delete(@id)
      session_cart
      format.js
    end
  end

  private

  def cart_user
    return redirect_to root_path unless required_cart?
  end

  def product_params_id
    @id = params[:id]
    @product = Product.find_by @id
    return if @product
    flash[:danger] = t :not_found_product
    redirect_to root_path
  end
end
