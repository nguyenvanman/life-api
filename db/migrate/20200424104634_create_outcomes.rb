class CreateOutcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :outcomes do |t|
      t.float :value, default: 0.0
      t.string :note
      t.datetime :time
      t.jsonb :detail
      t.references :user
      t.timestamps
    end
  end
end
