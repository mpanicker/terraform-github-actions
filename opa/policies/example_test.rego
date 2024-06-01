package policies.test

import rego.v1

import data.policies.friday_deploys

test_friday_deploys if {
	policies.friday_deploys.deny
}

