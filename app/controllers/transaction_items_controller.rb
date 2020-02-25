class TransactionItemsController < ApplicationController

  def create
    render_data TransactionItemService::Create.call(@current_user, transaction_item_params)
  end

  def transaction_item_params
    params.require(%i[amount time note categories])
    params.permit(:amount, :time, :note,  categories: [])
  end
end
