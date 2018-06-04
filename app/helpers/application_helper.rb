module ApplicationHelper
  def price_total_cart product, quantity
    number = product.new_price.to_i * quantity.to_i
    number_to_currency(number, separator: ",", delimiter: ".")
  end

  def number_format number
    number_to_currency(number, separator: ",", delimiter: ".")
  end

  def total_cart products
    total = 0
    products.each do |product,quantity|
      total += product.new_price*quantity
    end
    total
  end

  def gravatar_for product
    image_tag product.images,alt: product.name
  end

  def get_user_images comment
    if comment.images.present?
      image = comment.images
    else
      image = "https://png.icons8.com/dotty/2x/administrator-male.png"
    end
    image_tag image
  end

  def full_title page_title = ""
    base_title = t "base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
