module TransactionItemService::Update
  def self.call(transaction_item, transaction_item_params)
    transaction_item.update!(transaction_item_params.except(:categories))   
    transaction_item.user.recalculate_budget
    categories = transaction_item_params[:categories]
    transaction_item.categories << CategoryService::FindOrCreate.call_for_list(categories)
    transaction_item.categories = transaction_item.categories.uniq { |it| it.id }
    transaction_item
  end
end   