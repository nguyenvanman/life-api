class User < ApplicationRecord
  has_one :account, dependent: :destroy
end
