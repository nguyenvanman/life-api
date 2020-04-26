class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :total, :atm, :cash
end
