Feature: CI Android
  All screens should launch fine
  @non-ci
  Scenario: Settings
    Given I click about phone
    Then the Android version is a number
  @ci_smoke
  Scenario: Open ci app and navigate to login screen
    Given I open login screen on app
    And I click add contact
    Then I verify contact screen is displayed
  @ci_add_contact
  Scenario: Add contact
    Given I open login screen on app
    And I click add contact
    Then I successfully add a contact
    And verify that it was added
  @ci_smoke
  Scenario: Take screenshots
    Given I open login screen on app
    And I click add contact
    Then take screenshot of contact form

  @ci_add_contact_sauce
  Scenario: Contact on sauce
    Given I open login screen on app
    And I click add contact
    Then I successfully add a contact
    And verify that it was added



