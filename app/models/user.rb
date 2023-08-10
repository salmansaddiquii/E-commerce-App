class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { vendor: 0, customer: 1 }

  # Associations
  has_many :products, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :categories, dependent: :destroy
end
