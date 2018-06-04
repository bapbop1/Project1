class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :name, :images, to: :user, allow_nil: true

  validates :description, presence: true,
    length: {maximum: Settings.validate.content_max_length}
end
