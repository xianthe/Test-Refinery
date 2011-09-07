@testimonials
Feature: Testimonials
  In order to have testimonials on my website
  As an administrator
  I want to manage testimonials

  Background:
    Given I am a logged in refinery user
    And I have no testimonials

  @testimonials-list @list
  Scenario: Testimonials List
   Given I have testimonials titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of testimonials
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @testimonials-valid @valid
  Scenario: Create Valid Testimonial
    When I go to the list of testimonials
    And I follow "Add New Testimonial"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 testimonial

  @testimonials-invalid @invalid
  Scenario: Create Invalid Testimonial (without title)
    When I go to the list of testimonials
    And I follow "Add New Testimonial"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 testimonials

  @testimonials-edit @edit
  Scenario: Edit Existing Testimonial
    Given I have testimonials titled "A title"
    When I go to the list of testimonials
    And I follow "Edit this testimonial" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of testimonials
    And I should not see "A title"

  @testimonials-duplicate @duplicate
  Scenario: Create Duplicate Testimonial
    Given I only have testimonials titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of testimonials
    And I follow "Add New Testimonial"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 testimonials

  @testimonials-delete @delete
  Scenario: Delete Testimonial
    Given I only have testimonials titled UniqueTitleOne
    When I go to the list of testimonials
    And I follow "Remove this testimonial forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 testimonials
 