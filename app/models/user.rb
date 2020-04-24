class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_one :config, dependent: :destroy, class_name: 'UserConfig'
  has_one :budget, dependent: :destroy
  has_many :transaction_items, dependent: :destroy
  validates :name, presence: true

  def update_budget transaction_item
    if transaction_item.income?
      config.increase_budget transaction_item.amount
    else
      config.decrease_budget transaction_item.amount
    end
  end

end
