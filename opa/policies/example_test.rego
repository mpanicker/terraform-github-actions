package terraform.policies.test

import rego.v1

import data.terraform.policies.friday_deploys

test_friday_deploys if {
	terraform.policies.friday_deploys.deny
}

