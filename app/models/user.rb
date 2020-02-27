class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_one :config, dependent: :destroy, class_name: 'UserConfig'
  has_many :transaction_items, dependent: :destroy
  validates :name, presence: true
end
