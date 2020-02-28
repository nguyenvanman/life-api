class TransactionItem < ApplicationRecord
  belongs_to :user 
  has_and_belongs_to_many :categories
  enum transaction_type: { income: 'income', outcome: 'outcome' }
  
  scope :in_date, ->(date, id){ where("DATE(time) = ?", date.to_date).where(user_id: id) }
  scope :in_week, ->(date, id){ where("extract(week from time) = ?", date.cweek).where(user_id: id) }
  scope :in_month, ->(date, id){ where("extract(month from time) = ?", date.month).where(user_id: id) }
  
end
