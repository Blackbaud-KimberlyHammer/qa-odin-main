Feature: AWS Status

  Scenario: Get the status of all AWS instances
    Given I ask Odin for the status of all 'aws' instances
    Then The machine named 'Bastion' should have a status of 'running'