require "spec_helper"

describe BudgetsController do
  describe "routing" do
    it "recognizes and generates #annual" do
      { :get => "/budgets/annual" }.should route_to(:controller => "budgets", :action => "annual")
    end
  end
end

