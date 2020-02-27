class CreateUserData < ActiveRecord::Migration[6.0]
  def change
    create_table :user_data do |t|
      t.bigint :user_id
      t.float :current_budget, default: 0
      t.timestamps
    end
  end
end
