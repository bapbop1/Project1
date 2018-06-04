class Supports::ProductSupport
  attr_reader :product

  def initialize product
    @product = product
  end

  def comments
    @comment ||= @product.comments
  end

  def product_slibar
    @product_new ||= Product.order_product.limit Settings.settings.limit_product_slibar
  end
end
