class CreateGroupsAndBudgets < ActiveRecord::Migration[7.0]
  def change
    create_join_table :budgets, :groups do |t|
      t.index :budget_id
      t.index :group_id

    end
  end
end
