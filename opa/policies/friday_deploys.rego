package terraform.policies.friday_deploys

deny[msg] {
  time.weekday(time.now_ns()) == "Saturday"

  msg := "No deployments allowed on Fridays"
}
