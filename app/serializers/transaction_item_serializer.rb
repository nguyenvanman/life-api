class TransactionItemSerializer < ActiveModel::Serializer
  attributes :id, :amount, :note, :time, :transaction_type
end
