module TransactionItemService::GetByCategory
  def self.call category_id
      category = Category.find_by(id: category_id)
      category.transaction_items if category
  end
end