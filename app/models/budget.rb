class Budget < ActiveRecord::Base
  belongs_to :source
  belongs_to :budget_item
end
