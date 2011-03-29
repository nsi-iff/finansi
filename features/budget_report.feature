Feature: Budget report
  As a group manager
  I want to check the group's annual budget
  In order to facilitate budget analysis

  Scenario: View budget value/year/source as a table
    Given exist the following budgets
      | year | value | source    |
      | 2001 | 2000  | CEFET     |
      | 2001 | 12500 | PETROBRAS |
      | 2001 | 1000  | PETROBRAS |
      | 2002 | 20000 | RENAPI    |
      | 2003 | 4000  | RENAPI    |
      | 2003 | 2000  | NEXEDI    |
      | 2003 | 1200  | CNPq      |
    When I go to the budget report page
    Then I should see the "annual-budget" table
      | Source/Year | 2001      | 2002      | 2003     | Total     | %      |
      | CEFET       | 2.000,00  | 0,00      | 0,00     | 2.000,00  | 4,68   |
      | PETROBRAS   | 13.500,00 | 0,00      | 0,00     | 13.500,00 | 31,62  |
      | RENAPI      | 0,00      | 20.000,00 | 4.000,00 | 24.000,00 | 56,21  |
      | NEXEDI      | 0,00      | 0,00      | 2.000,00 | 2.000,00  | 4,68   |
      | CNPq        | 0,00      | 0,00      | 1.200,00 | 1.200,00  | 2,81   |
      | Total       | 15.500,00 | 20.000,00 | 7.200,00 | 42.700,00 | 100,00 |

