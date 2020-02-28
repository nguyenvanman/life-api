module TransactionItemService::Index
  def self.call(date, type)
    date = (date || DateTime.now).to_datetime
    if type == 'week'
      TransactionItem.includes(:categories).mine.in_week(date)
    elsif type == 'month'
      TransactionItem.includes(:categories).mine.in_month(date)
    else
      TransactionItem.includes(:categories).mine.in_date(date)
    end
  end
end