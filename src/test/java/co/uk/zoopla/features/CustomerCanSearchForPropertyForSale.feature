Feature: Properties For Sale
  As a customer
  I want the ability to search any property of my choice
  So that I can buy the property


  Scenario Outline: Customer can search for any properties for sale
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And I select "<Property>" from property dropdown
    And I select "<Bed>" from bedrooms dropdown
    And I click on Search button
    Then a list of "<PropertyType>" in "<Location>" are displayed

    Examples:
      |Location|MinPrice|MaxPrice|Property|Bed|PropertyType|
      |Manchester|£120,000|£230,000|House |3+ |Houses      |
      |London    |£250,000|£400,000|Farm/Land|No min| Property|
      |Coventry  |£120,000|£230,000|Flats    |3+    |Flats    |
      |Birmingham|        |        |         |      |         |


  @ignore
  Scenario Outline: Customer cannot search for property with missing values
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And I select "<Property>" from property dropdown
    And I select "<Bed>" from bedrooms dropdown
    And I click on Search button
    Then an error message displayed

    Examples:
      |Location| MinPrice|MaxPrice|Property|Bed|PropertyType|
      |        |£120,000 |£230,000|Houses  |3+ |Houses      |


  @ignore
  Scenario Outline: Error page is displayed for invalid search
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I select "<MaxPrice>" from Max price dropdown
    And I select "<Property>" from property dropdown
    And I select "<Bed>" from bedrooms dropdown
    And I click on Search button
    Then an error message displayed

    Examples:
      |Location| MinPrice|MaxPrice|Property|Bed|PropertyType|
      |M39 1Xc        |£120,000 |£230,000|Houses  |3+ |Houses      |
      |£££            |£250,000 |£400,000|Farm/Land|No min|Property|
      |123            |£120,000 |£230,000|Flats    |3+    |Flats   |
      |123            |         |        |         |      |        |

