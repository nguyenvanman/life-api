class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_one :user_datum, dependent: :destroy
  has_many :transaction_items, dependent: :destroy
  validates :name, presence: true
end
