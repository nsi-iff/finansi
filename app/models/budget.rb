class Budget < ActiveRecord::Base
  belongs_to :source
  belongs_to :budget_item

  def self.totals_by_source
    totals = {}
    Source.all.each do |source|
      total = Budget.where('source_id = ?', source.id).map(&:value).sum
      totals[source] = total if total > 0
    end
    totals
  end

  def self.annual_table
    budgets = Budget.all
    years = budgets.map(&:year).uniq
    table = [['Source/Year'] + years + ['Total', '%']]
    subtotals = {}
    Source.all.each do |source|
      line = [source.acronym]
      budgets_from_this_source = budgets.select {|b| b.source == source }
      years.each do |year|
        line << budgets_from_this_source.select {|b| b.year == year }.map(&:value).sum
      end
      total_by_this_source = budgets_from_this_source.map(&:value).sum
      line << total_by_this_source
      subtotals[source.acronym] = total_by_this_source
      table << line
    end

    total_line = ['Total']
    years.each do |year|
      total_line << budgets.select {|b| b.year == year}.map(&:value).sum
    end
    total_sum = budgets.map(&:value).sum
    total_line << total_sum
    total_line << 100.0
    table << total_line

    table[1..(table.count-2)].each_with_index do |line, index|
      line << (subtotals[line[0]] / total_sum * 100).round(12)
    end
    table
  end

  def self.totals_by_year
    group('year').order('year').sum('value')
  end
end

