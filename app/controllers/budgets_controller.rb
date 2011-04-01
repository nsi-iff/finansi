class BudgetsController < InheritedResources::Base
  def report
    @budget_table = Budget.annual_table
    @total_by_source = Budget.totals_by_source.map {|source, total| [source.acronym, total] }
    @total_by_year = Budget.totals_by_year.map {|year, value| [year, value]}

    data = Budget.budget_by_source_annual_evolution
    sources = data.values.map(&:keys).flatten.uniq.sort_by(&:acronym)
    @budget_by_source_annual_evolution = []
    data.keys.sort.each do |year|
      this_year_array = []
      sources.each do |source|
        this_year_array << (data[year][source] || 0)
      end
      @budget_by_source_annual_evolution << this_year_array
    end
    @years = data.keys.sort
    @sources = sources.map(&:acronym)
  end
end

