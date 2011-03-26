class Budget < ActiveRecord::Base
  belongs_to :source
  belongs_to :budget_item

  def self.annual_table
    budgets = Budget.all
    years = budgets.map(&:year).uniq
    table = [['Source/Year'] + years]
    Source.all.each do |source|
      line = [source.acronym]
      years.each do |year|
        line << budgets.select {|b| b.year == year && b.source == source }.map(&:value).sum
      end
      table << line
    end
    table
  end
end

