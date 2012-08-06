@javascript
Feature: Scheduling
  As a user
  I want to assign contractors to projects by week
  So that people know what to work on

  Background:
    Given there are active projects

  Scenario: Seeing active projects
    When I visit "/schedule"
    Then I should see all the active projects

  Scenario: Seeing weeks
    When I visit "/schedule"
    Then I should see 7 weeks starting with the current week

  Scenario: Seeing contractors
    Given there are contractors
    When I visit "/schedule"
    Then I should see all of the contractors

  Scenario: Assigning contractors
    Given there is a contractor named "John"
    When I visit "/schedule"
    And I drag the contractor to the first cell for the first project
    Then I should see "John" in the first cell for the first project

  Scenario: Persisted contractor assignments
    Given there is a contractor named "John"
    When I visit "/schedule"
    And I drag the contractor to the first cell for the first project
    And I reload the page
    Then I should see "John" in the first cell for the first project

  Scenario: Removing assignments
    Given there is a contractor named "John"
    And the contractor is assigned to a project this week
    When I visit "/schedule"
    And I click to delete the assignment
    Then I should not see the assignment

  Scenario: Creating multiple assignments for one project week
    Given there is a contractor named "John"
    And there is a contractor named "Sally"
    When I visit "/schedule"
    And I drag contractor "John" to the first cell for the first project
    And I drag contractor "Sally" to the first cell for the first project
    Then I should see "John" in the first cell for the first project
    And I should see "Sally" in the first cell for the first project

  Scenario: Seeing users on the bench
    Given there is a contractor named "John"
    When I visit "/schedule"
    Then I should see "John" on the bench for each week

  Scenario: Moving an assignment
    Given there is a contractor named "John"
    And the contractor is assigned to the first project this week
    When I visit "/schedule"
    When I drag the assignment to the second project for the second week
    And I visit "/schedule"
    Then I should see "John" in the second project for the second week
