require 'spec_helper'

describe Budget do
  describe 'annual budget' do
    it 'sums budgets by source' do
      Source.stub!(:all).and_return([
        (cefet = stub_model(Source, :acronym => 'CEFET')),
        (renapi = stub_model(Source, :acronym => 'RENAPI')),
        (cnpq = stub_model(Source, :acronym => 'CNPq'))])
      Budget.stub(:all).and_return([
        Budget.new(:year => 2001, :value => 2000, :source => renapi),
        Budget.new(:year => 2001, :value => 3000, :source => cnpq),
        Budget.new(:year => 2002, :value => 4000, :source => cefet),
        Budget.new(:year => 2002, :value => 6000, :source => cnpq),
        Budget.new(:year => 2003, :value => 7000, :source => cefet),
        Budget.new(:year => 2003, :value => 8000, :source => renapi),
        Budget.new(:year => 2003, :value => 2000, :source => renapi),
        Budget.new(:year => 2003, :value => 9000, :source => cnpq)])
      Budget.annual_table.should == [
       ['Source/Year', 2001, 2002, 2003],
       ['CEFET', 0.0, 4000.0, 7000.0],
       ['RENAPI', 2000.0, 0.0, 10000.0],
       ['CNPq', 3000.0, 6000.0, 9000.0]]
    end
  end
end

