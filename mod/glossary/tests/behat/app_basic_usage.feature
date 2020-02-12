@mod @mod_glossary @app @javascript
Feature: Test basic usage of glossary in app
  In order to participate in the glossaries while using the mobile app
  As a student
  I need basic glossary functionality to work

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher  | teacher  | teacher1@example.com |
      | teacher2 | Teacher2 | teacher2 | teacher2@example.com |
      | student1 | Student  | student  | student1@example.com |

    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |

    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
      | teacher2 | C1 | editingteacher |
      | student1 | C1 | student |

    And the following "activities" exist:
      | activity | name          | intro                | course | idnumber  | mainglossary | allowcomments | assessed   | scale |
      | glossary | Test glossary | glossary description | C1     | gloss1    | 1            | 1             | 1          | 1     |

    And the following "activities" exist:
      | activity   | name            | intro       | course | idnumber | groupmode |
      | forum      | Test forum name | Test forum  | C1     | forum    | 0         |

  @app @3.8.0 @OK
  Scenario: View a glossary and its terms
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I press "car" in the app
  Then I should see "car"
  And I should see "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods."

  @app @3.8.0 @OK
  Scenario: Change filters (include search)
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I press "Browse entries" in the app
  And I press "Search" in the app
  And I set the field "Search query" to "something" in the app
  And I press "search" in the app
  Then I should see "No entries were found."
  And I set the field "Search query" to "potato" in the app
  And I press "search" in the app
  And I set the field "Search query" to " " in the app
  And I press "potato" in the app
  Then I should see "potato"
  And I should see "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae."

  @app @3.8.0 @OK
  Scenario: See comments
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I press "mountain" in the app
  Then I should see "Comments (0)"
  When I enter the app
  And I log in as "teacher1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  Then I should see "Comments (0)"
  And I press "Comments" in the app
  And I should see "No comments"
  And I press "close" in the app
  And I set the field "Add a comment..." to "teacherComment" in the app
  And I press "Save comment" in the app
  Then I should see "teacherComment"
  And I press "close" in the app
  And I set the field "Add a comment..." to "teacherComment2" in the app
  And I press "Save comment" in the app
  Then I should see "teacherComment"
  And I should see "teacherComment2"
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  Then I should see "Comments (2)"
  And I press "Comments" in the app
  And I should see "teacherComment"
  And I should see "teacherComment2"

  @app @3.8.0 @OK
  Scenario: Prefetch
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I press "Display options" in the app
  And I press "Download" in the app
  And I press the back button in the app
  And I press the back button in the app
  And I press "Course 1" near "Recently accessed courses" in the app
  And I switch offline mode to "true"
  And I press "Test glossary" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I press "mountain" in the app
  Then I should see "mountain"
  And I should see "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak."
  And I should not see "Comments cannot be retrieved"
  And I should see "Comments (0)"

  @app @3.8.0 @OK
  Scenario: Sync
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I switch offline mode to "true"
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I should see "Entries to be synced"
  And I should see "This Glossary has offline data to be synchronised."
  And I switch offline mode to "false"
  And I press "close" in the app
  And I set the field "Concept" to "testSync" in the app
  And I set the field "Definition" to "testSync" in the app
  And I press "Save" in the app
  And I press "Display options" in the app
  And I press "Synchronise now" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  And I should see "testSync"
  And I should not see "Entries to be synced"
  And I should not see "This Glossary has offline data to be synchronised."

  @app @3.8.0 @mobile @OK
  Scenario: Add/view ratings (mobile)
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  When I enter the app
  And I log in as "teacher1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  Then I should see "Average of ratings: -"
  And I press "None" in the app
  And I press "1" in the app
  Then I should see "Average of ratings: 1"
  When I enter the app
  And I log in as "teacher2"
  Then the header should be "Acceptance test site" in the app
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  And I switch offline mode to "true"
  And I press "None" in the app
  And I press "0" in the app
  Then I should see "Data stored in the device because it couldn't be sent. It will be sent automatically later."
  And I should see "Average of ratings: 1"
  And I switch offline mode to "false"
  And I press the back button in the app
  Then I should see "This Glossary has offline data to be synchronised."
  And I press "Display options" in the app
  And I press "Synchronise now" in the app
  And I press "mountain" in the app
  Then I should see "Average of ratings: 0.5"
  When I enter the app
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  Then the header should be "mountain" in the app
  And I should not see "Average of ratings: 0.5"

  @app @3.8.0 @tablet @OK
  Scenario: Add/view ratings (tablet)
  When I enter the app
  And I change viewport size to "1280x1080"
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "close" in the app
  And I set the field "Concept" to "potato" in the app
  And I set the field "Definition" to "The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself, a perennial in the family Solanaceae." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "car" in the app
  And I set the field "Definition" to "A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four tires, and mainly transport people rather than goods." in the app
  And I press "Save" in the app
  And I press "close" in the app
  And I set the field "Concept" to "mountain" in the app
  And I set the field "Definition" to "A mountain is a large landform that rises above the surrounding land in a limited area, usually in the form of a peak." in the app
  And I press "Save" in the app
  Then the header should be "Test glossary" in the app 
  And I should see "car"
  And I should see "mountain"
  And I should see "potato"
  When I enter the app
  And I change viewport size to "1280x1080"
  And I log in as "teacher1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  Then I should see "Average of ratings: -"
  And I press "None" in the app
  And I press "1" in the app
  Then I should see "Average of ratings: 1"
  When I enter the app
  And I change viewport size to "1280x1080"
  And I log in as "teacher2"
  Then the header should be "Acceptance test site" in the app
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  And I switch offline mode to "true"
  And I press "None" in the app
  And I press "0" in the app
  Then I should see "Data stored in the device because it couldn't be sent. It will be sent automatically later."
  And I should see "Average of ratings: 1"
  And I switch offline mode to "false"
  Then I should see "This Glossary has offline data to be synchronised."
  And I press "Display options" in the app
  And I press "Synchronise now" in the app
  Then I should see "Average of ratings: 0.5"
  When I enter the app
  And I change viewport size to "1280x1080"
  And I log in as "student1"
  Then the header should be "Acceptance test site" in the app 
  And I should see "Course 1"
  And I press "Course 1" near "Recently accessed courses" in the app
  Then the header should be "Course 1" in the app
  And I press "Test glossary" in the app
  And I press "mountain" in the app
  Then I should not see "Average of ratings: 0.5"