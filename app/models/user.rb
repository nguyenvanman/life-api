class User < ApplicationRecord
  has_one :account, dependent: :destroy  
  has_one :budget, dependent: :destroy
  has_many :transaction_items, dependent: :destroy
  
  validates :name, presence: true

  after_create :create_budget

  def update_budget transaction_item
    
  end
end
