require 'spec_helper'

describe BudgetsController do
  describe 'annual' do
    def stub_all_except(method)
      [:annual_table, :totals_by_source, :totals_by_year].
        reject {|m| m == method }.
        each {|m| Budget.stub(m).and_return({}) }
    end

    it 'puts the result of annual_table in @budget_table' do
      stub_all_except(:annual_table)
      Budget.stub(:annual_table).and_return(result = stub)
      get :report
      assigns[:budget_table].should == result
    end

    it 'total by source' do
      source1 = Source.new(:acronym => 'IFF')
      source2 = Source.new(:acronym => 'NSI')
      stub_all_except(:totals_by_source)
      Budget.stub(:totals_by_source).and_return(source1 => 100, source2 => 1000)
      get :report
      assigns[:total_by_source].should == [['IFF', 100], ['NSI', 1000]]
    end

    it 'total by year' do
      stub_all_except(:totals_by_year)
      Budget.stub(:totals_by_year).and_return(2008 => 1000, 2009 => 2000, 2010 => 3000)
      get :report
      assigns[:total_by_year].should == [[2008, 1000], [2009, 2000], [2010, 3000]]
    end
  end
end

