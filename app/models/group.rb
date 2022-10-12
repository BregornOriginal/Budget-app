class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :budgets

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }

  def transactions
    budgets.order('created_at DESC')
  end
end
