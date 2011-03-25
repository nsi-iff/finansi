Feature: Manage budgets
  As a group manager
  I want to keep the group's financial records
  In order to easy financial report generation

  Scenario: register budget item
    Given exist the following source:
      | acronym |
      | CEFET   |
    And exist the following budget item:
      | name  |
      | Grant |
    And I am on the new budget page
    When I fill in the following:
      | Year  | 2009 |
      | Value | 6000 |
    And I select "CEFET" from "Source"
    And I select "Grant" from "Budget item"
    And I press "Save"
    Then I should see "Budget item: Grant"
    Then I should see "Year: 2009"
    And I should see "Value: R$ 6.000,00"
    And I should see "Source: CEFET"

