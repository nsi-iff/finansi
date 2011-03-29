require "spec_helper"

describe BudgetsController do
  describe "routing" do
    it "recognizes and generates #report" do
      { :get => "/budgets/report" }.should route_to(:controller => "budgets", :action => "report")
    end
  end
end

