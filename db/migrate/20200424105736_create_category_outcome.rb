class CreateCategoryOutcome < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_outcomes do |t|
      t.references :outcome, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
