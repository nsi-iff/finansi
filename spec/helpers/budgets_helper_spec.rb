require 'spec_helper'

describe BudgetsHelper do
  it 'renders a matrix as table' do
    annual_budget = [['Source/Year', 2001, 2002, 2003],
                     ['CEFET', 0.0, 4000.0, 7000.0],
                     ['RENAPI', 2000.0, 0.0, 8000.0],
                     ['CNPq', 3000.0, 6000.0, 9000.0]]
    result = helper.render_table(annual_budget, :id => 'annual', :class => 'financial')
    result.should == "<table id='annual' class='financial'>" +
                       "<thead>" +
                         "<tr><th>Source/Year</th><th>2001</th><th>2002</th><th>2003</th></tr>" +
                        "</thead>" +
                        "<tbody>" +
                          "<tr><th>CEFET</th><td>0,00</td><td>4.000,00</td><td>7.000,00</td></tr>" +
                          "<tr><th>RENAPI</th><td>2.000,00</td><td>0,00</td><td>8.000,00</td></tr>" +
                          "<tr><th>CNPq</th><td>3.000,00</td><td>6.000,00</td><td>9.000,00</td></tr>" +
                        "</tbody>" +
                      "</table>"
  end
end

