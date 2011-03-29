class BudgetsController < InheritedResources::Base
  def report
    @budget_table = Budget.annual_table
    @total_by_source = Budget.totals_by_source.map {|source, total| [source.acronym, total] }
    @total_by_year = Budget.totals_by_year.map {|year, value| [year, value]}
  end
end

