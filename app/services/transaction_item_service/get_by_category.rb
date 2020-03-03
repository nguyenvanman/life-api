module TransactionItemService::GetByCategory
  def self::call category_id
      Category.find(category_id).transaction_items if Category.find(category_id)
  end
end