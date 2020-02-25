class TransactionItemsController < ApplicationController

  def create
    transaction_item = TransactionItemService::Create.call(@current_user, transaction_item_params)
    render_one transaction_item
  end

  def render_one transaction_item
    data = {
      transaction_item: TransactionItemSerializer.new(transaction_item)
    }

    render_data data
  end

  def transaction_item_params
    params.require(%i[amount time note transaction_type categories])
    params.permit(:amount, :time, :note, :transaction_type, categories: [])
  end
end
