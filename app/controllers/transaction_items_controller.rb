class TransactionItemsController < ApplicationController

  def create
    transaction_item = TransactionItemSerializer.new(TransactionItemService::Create.call(@current_user, transaction_item_params))
    render_data transaction_item
  end

  def transaction_item_params
    params.require(%i[amount time note transaction_type categories])
    params.permit(:amount, :time, :note, :transaction_type, categories: [])
  end
end
