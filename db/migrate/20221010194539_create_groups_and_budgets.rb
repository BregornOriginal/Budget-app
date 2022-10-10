class CreateGroupsAndBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_and_budgets, id: false do |t|
      t.belongs_to :group
      t.belongs_to :budget
    end
  end
end
