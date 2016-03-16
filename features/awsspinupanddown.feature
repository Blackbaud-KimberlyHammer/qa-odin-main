
Feature: AWS Spin Up and Down Cucumber Test Rig

  Background:
    Given I ask Odin for the status of all 'aws' instances
    And I generate a random uid for the test rig

  Scenario: Spin Up and Down Cucumber Test Rig
    Given The machine named 'OdinTestRig' with a unique identifier does not exist in aws
    And I tell Odin to spin up a test rig named 'OdinTestRig' with a unique identifier in 'aws'
    And I ask Odin for the status of all 'aws' instances
    And The machine named 'OdinTestRig' with a unique identifier exists in aws
    And The machine named 'OdinTestRig' with a unique identifier does not have a status of 'terminated'
    And I tell Odin to spin down a test rig named 'OdinTestRig' with a unique identifier in 'aws'
    And The machine named 'OdinTestRig' with a unique identifier exists in aws
    Then The machine named 'OdinTestRig' with a unique identifier should have a status of 'pending'