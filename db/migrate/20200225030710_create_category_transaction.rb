class CreateCategoryTransaction < ActiveRecord::Migration[6.0]
  def change
    create_table :category_transactions do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end