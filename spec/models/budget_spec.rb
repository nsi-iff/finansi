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
       ['Source/Year', 2001, 2002, 2003, 'Total', '%'],
       ['CEFET', 0.0, 4000.0, 7000.0, 11000.0, 26.829268292683],
       ['RENAPI', 2000.0, 0.0, 10000.0, 12000.0, 29.268292682927],
       ['CNPq', 3000.0, 6000.0, 9000.0, 18000.0, 43.90243902439],
       ['Total', 5000.0, 10000.0, 26000.0, 41000.0, 100.0]]
    end
  end
end

