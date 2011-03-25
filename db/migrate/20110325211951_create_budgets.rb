class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
      t.integer :year
      t.float :value
      t.references :source
      t.references :budget_item

      t.timestamps
    end
  end

  def self.down
    drop_table :budgets
  end
end
