class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :transactions, dependent: :destroy
  validates :name, presence: true
end
