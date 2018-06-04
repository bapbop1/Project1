class Category < ApplicationRecord
  has_many :products
  default_scope ->{order(created_at: :desc)}
  validates :name, presence: true, length: {maximum: 50}
end
