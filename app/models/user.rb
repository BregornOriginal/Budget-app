class User < ApplicationRecord
  has_many :groups
  has many :budgets
end
