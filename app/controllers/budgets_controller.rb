class BudgetsController < InheritedResources::Base
  def annual
    @budget_table = Budget.annual_table
  end
end

