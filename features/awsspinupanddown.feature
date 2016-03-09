
Feature: AWS Spin Up and Down Cucumber Test Rig

  Scenario: Spin up Cucumber Test Rig
    Given I tell Odin to spin up a test rig named 'OdinTestRig' in 'aws'
    And I ask Odin for the status of all 'aws' instances
    And The machine named 'OdinTestRig' exists
    Then The machine named 'OdinTestRig' should have a status of 'running'

  Scenario: Spin down Cucumber Test Rig
    And I ask Odin for the status of all 'aws' instances
    And The machine named 'OdinTestRig' exists
    And I tell Odin to spin down a test rig named 'OdinTestRig' in 'aws'
    Then The machine named 'OdinTestRig' should have a status of 'pending'