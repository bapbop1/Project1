class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  enum status: [:hide, :display]

  validates :status, presence: true

  scope :ordered, ->{order created_at: :desc}
end
