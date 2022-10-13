class Budget < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :groups, presence: true

  def total_price
    sum = 0
    budgets.includes([:budgets_groups]).each do |transaction|
      sum += transaction.amount
    end
    sum
  end
end
