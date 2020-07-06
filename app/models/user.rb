class User < ApplicationRecord
  has_one :account, dependent: :destroy  
  has_one :budget, dependent: :destroy
  has_many :transaction_items, dependent: :destroy
  
  validates :name, presence: true

  after_create :create_budget

  def update_budget transaction_item
    f = transaction_item.income? ? 1 : -1
    if transaction_item.atm? 
      budget.atm += f * transaction_item.amount
    else 
      budget.cash += f * transaction_item.amount
    end

    budget.total = budget.atm + budget.cash
    budget.save
  end

  def recalculate_budget
    budget.atm = transaction_items.select { |it| it.income? && it.atm? }.inject(0) { |sum, x| sum + x.amount } - transaction_items.select { |it| it.outcome? && it.atm? }.inject(0) { |sum, x| sum + x.amount }
    budget.cash = transaction_items.select { |it| it.income? && it.cash? }.inject(0) { |sum, x| sum + x.amount } - transaction_items.select { |it| it.outcome? && it.cash? }.inject(0) { |sum, x| sum + x.amount }
    budget.total = budget.atm + budget.cash
    budget.save
  end
end
