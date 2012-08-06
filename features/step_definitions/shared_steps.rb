When /^I visit "([^"]*)"$/ do |path|
  visit path
end

Then /^open page$/ do
  save_and_open_page
end

When /^I reload the page$/ do
  visit current_path
end

