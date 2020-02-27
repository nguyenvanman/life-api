class TransactionItemSerializer < ActiveModel::Serializer
  attributes :id, :amount, :note, :time, :transaction_type
  has_many :categories, serializer: CategorySerializer
end
