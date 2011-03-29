require 'spec_helper'

describe Budget do
  describe 'budget calculations' do
    before :each do
      @cefet = Source.create!(:acronym => 'CEFET')
      @renapi = Source.create!(:acronym => 'RENAPI')
      @cnpq = Source.create!(:acronym => 'CNPq')
      Budget.create!(:year => 2001, :value => 2000, :source => @renapi)
      Budget.create!(:year => 2001, :value => 3000, :source => @cnpq)
      Budget.create!(:year => 2002, :value => 4000, :source => @cefet)
      Budget.create!(:year => 2002, :value => 6000, :source => @cnpq)
      Budget.create!(:year => 2003, :value => 7000, :source => @cefet)
      Budget.create!(:year => 2003, :value => 8000, :source => @renapi)
      Budget.create!(:year => 2003, :value => 2000, :source => @renapi)
      Budget.create!(:year => 2003, :value => 9000, :source => @cnpq)
    end

    it 'provides a source/year table' do
      Budget.annual_table.should == [
       ['Source/Year', 2001, 2002, 2003, 'Total', '%'],
       ['CEFET', 0.0, 4000.0, 7000.0, 11000.0, 26.829268292683],
       ['RENAPI', 2000.0, 0.0, 10000.0, 12000.0, 29.268292682927],
       ['CNPq', 3000.0, 6000.0, 9000.0, 18000.0, 43.90243902439],
       ['Total', 5000.0, 10000.0, 26000.0, 41000.0, 100.0]]
    end

    it 'calculates totals by source' do
      Budget.totals_by_source.should == {
        @cefet => 11_000.0,
        @renapi => 12_000.0,
        @cnpq => 18_000.0
      }
    end

    it 'calculates totals by year' do
      Budget.totals_by_year.should == {
        2001 => 5_000.0,
        2002 => 10_000.0,
        2003 => 26_000.0
      }
    end
  end
end

