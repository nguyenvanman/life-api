user = User.create!(
  name: 'Nguyen Van Man'
)

Category.create!(
  name: 'Food'
)

user.transaction_items.create!(
  amount: 200000,
  note: 'Buy garena card',
  time: DateTime.now
)
