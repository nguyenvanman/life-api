module TransactionItemService::Index
  def self.call(date, type, id)
    date = (date || DateTime.now).to_datetime
    if type == 'week'
      TransactionItem.in_week(date, id)
    elsif type == 'month'
      TransactionItem.in_month(date, id)
    else
      TransactionItem.in_date(date, id)
    end
  end
end