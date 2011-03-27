class BudgetsController < InheritedResources::Base
  def annual
    @budget_table = Budget.annual_table
    @annual_data = Budget.totals_by_source.map {|source, total| [source.acronym, total] }
  end
end

