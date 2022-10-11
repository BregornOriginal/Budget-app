class Budget < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
