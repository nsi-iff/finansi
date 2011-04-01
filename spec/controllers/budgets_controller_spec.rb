require 'spec_helper'

describe BudgetsController do
  describe 'annual' do
    def stub_all_except(method)
      [:annual_table, :totals_by_source, :totals_by_year, :budget_by_source_annual_evolution].
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

    it 'budget by source annual evolution' do
      stub_all_except(:budget_by_source_annual_evolution)
      @renapi, @cefet, @cnpq = ['RENAPI', 'CEFET', 'CNPq'].map {|a| Source.new(:acronym => a) }
      Budget.stub(:budget_by_source_annual_evolution).and_return(
        2001 => { @renapi => 2_000, @cnpq => 3_000 },
        2002 => { @cefet => 4_000, @cnpq => 6_000 },
        2003 => { @cefet => 7_000, @renapi => 10_000, @cnpq => 9_000 })
      get :report
      assigns[:sources] = ['CEFET', 'CNPq', 'RENAPI']
      assigns[:budget_by_source_annual_evolution].should == [
        [0, 3_000, 2_000], [4_000, 6_000, 0], [7_000, 9_000, 10_000]]
      assigns[:years] = [2001, 2002, 2003]

    end
  end
end

