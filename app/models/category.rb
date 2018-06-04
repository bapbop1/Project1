class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  enum status: [:hide, :display]

  scope :ordered, ->{order(created_at: :desc)}
end
