class UserConfig < ApplicationRecord
  belongs_to :user
  def increase_budget amount
    self.current_budget += amount
  end

  def decrease_budget amount
    self.current_budget -= amount
  end
end
