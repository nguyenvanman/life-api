module TransactionItemService::Create
  def self.call(user, transaction_item_params)
      transaction_item = user.transaction_items.create!(transaction_item_params.except(:categories))
      if transaction_item.transaction_type.eql?('income')
        user.config.current_budget +=transaction_item.amount
      else
        user.config.current_budget -=transaction_item.amount
      end
      user.config.save
      categories = transaction_item_params[:categories]
      transaction_item.categories << categories.map do |category|
        CategoryService::FindOrCreate.call(category)
      end
      transaction_item
  end
end