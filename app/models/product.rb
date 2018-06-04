class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :comments
  has_many :order_details
end
