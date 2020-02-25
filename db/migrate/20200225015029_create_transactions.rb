class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user, nullable: false, foreign_key: true
      t.float :amount, nullable: false
      t.datetime :time, nullable: false
      t.text :note, nullable: false
      t.column :transaction_type, :transaction_types, default: 'outcome', nullable: false
      t.timestamps
    end
  end
end
