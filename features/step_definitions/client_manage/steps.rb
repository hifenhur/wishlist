Given('a object with {word} as name and {word} as email') do |name, email|
  @client_json = {name: name, email: email}
end

When('call for \/clients at method post') do
  visit "/user", :post, client: @client_json
end

Then('I should receive code {int} and a client at JSON format') do |int|
# Then('I should receive code {float} and a client at JSON format') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Given('id equals {int} of a client') do |int|
# Given('id equals {float} of a client') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

When('call for \/clients\/{int}') do |int|
# When('call for \/clients\/{float}') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Then('I should receive code {int} and a client at JSON format with id {int}') do |int, int2|
	raise
end