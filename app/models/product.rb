class Product < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :cart_items, dependent: :destroy

  validates :name, :price, presence: true, uniqueness: true
end
