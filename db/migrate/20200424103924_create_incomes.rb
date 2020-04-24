class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.float :value, null: false, default: 0.0
      t.string :note
      t.datetime :time
      t.string :source
      t.jsonb :detail
      t.references :user
      t.timestamps
    end
  end
end
