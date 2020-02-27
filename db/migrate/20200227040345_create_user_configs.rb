class CreateUserConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_configs do |t|
      t.references :user, foreign_key: true
      t.float :current_budget, default: 0   
      t.timestamps
    end
  end
end
