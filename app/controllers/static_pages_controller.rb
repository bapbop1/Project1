class StaticPagesController < ApplicationController
  before_action :load_menu, only: :home

  def home
    @products = Product.order_product.limit Settings.settings.limit_product
  end
end
