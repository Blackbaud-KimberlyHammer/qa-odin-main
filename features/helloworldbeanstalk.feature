@active

Feature: Beanstalk Hello World

  Scenario: Test the elastic beanstalk hello world
    Given I contact the nautilus elastic beanstalk endpoint
    Then It tells me 'hello Team Nautilus'