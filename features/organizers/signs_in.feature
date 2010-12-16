Feature: organizer signs in

  Scenario:
    Given I am not authenticated
    When I am authenticated as an organizer
    Then I should be on the home page
