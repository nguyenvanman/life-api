module TransactionItemService::Create
  def self.call(user, transaction_item_params)
      transaction_item = user.transaction_items.create!(transaction_item_params.except(:categories))
      categories = transaction_item_params[:categories]
      transaction_item.categories << categories.map do |category|
        CategoryService::FindOrCreate.call(category)
      end
      transaction_item
  end
end