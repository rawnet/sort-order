Scenario: Sort Order
  Given the following tokens: users.first_name, users.last_name asc, users.email 0

  When I output each as sql
  Then I should get the following list: users.first_name ASC, users.last_name ASC, users.email DESC 

  When I output the columns as sql
  Then I should get the following string: users.first_name ASC, users.last_name ASC, users.email DESC

  When I output the columns as sql (current only)
  Then I should get the following string: users.first_name ASC

  When I output the columns as sql (current only without table)
  Then I should get the following string: first_name ASC

  When I output each as a parameter
  Then I should get the following list: first_name 1, last_name 1, email 0

  When I output the columns as parameters
  Then I should get the following hash: {:order=>["first_name 1", "last_name 1", "email 0"]}

  When I output the columns as parameters (current only)
  Then I should get the following hash: {:order=>"first_name 1"}
  
Scenario: Flipping Sort Orders!!!!
  Given the following tokens: users.first_name, users.last_name asc, users.email 0

  When I flip the current column
  And I output the columns as sql (current only)
  Then I should get the following string: users.first_name DESC

  When I set the current column to: last_name 0
  And I output the columns as sql (current only)
  Then I should get the following string: users.last_name DESC





  