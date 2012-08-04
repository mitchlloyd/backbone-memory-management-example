### GIVEN ###

Given /^there are active projects$/ do
  @projects = 3.times.collect { FactoryGirl.create(:project) }
end

Given /^there are contractors$/ do
  @contractors = 3.times.collect { FactoryGirl.create(:contractor) }
end

Given /^there is a contractor named "([^"]*)"$/ do |name|
  @contractor = FactoryGirl.create(:contractor, name: name)
end

Given /^the contractor is assigned to a project this week$/ do
  @assignment = FactoryGirl.create(:assignment, contractor: @contractor)
end

Given /^the contractor is assigned to the first project this week$/ do
  project = @projects.first
  @assignment = FactoryGirl.create(
    :assignment,
    contractor: @contractor,
    project: project
  )
end


### WHEN ###

When /^I drag the contractor to the first cell for the first project$/ do
  id = @contractor.id
  contractor_el = page.find(".contractor[data-id=\"#{id}\"]")

  target_el = page.find("td")

  contractor_el.drag_to target_el
end

When /^I click to delete the assignment$/ do
  id = @assignment.id
  find(".assignment[data-id='#{id}'] a.delete").click
end

When /^I drag contractor "([^"]*)" to the first cell for the first project$/ do |name|
  @contractor = Contractor.find_by_name(name)
  step "I drag the contractor to the first cell for the first project"
end

When /^I drag the assignment to the second project for the second week$/ do
  assignment_el = page.find(".assignment[data-id='#{@assignment.id}']")
  target_el = page.all('tr.project').second.all('td').second
  assignment_el.drag_to target_el
end



### THEN ###

Then /^I should see all the active projects$/ do
  @projects.each do |project|
    page.should have_content(project.name)
  end
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^I should see (\d+) weeks starting with the current week$/ do |num_of_weeks|
  weeks = num_of_weeks.to_i.times.collect do |i|
    (DateTime.now.at_beginning_of_week(:sunday)) + i.weeks
  end

  weeks.each do |week|
    page.should have_content(week.strftime('%-m/%-d'))
  end
end

Then /^I should see all of the contractors$/ do
  @contractors.each do |contractor|
    page.should have_content(contractor.name)
  end
end

Then /^I should see "([^"]*)" in the first cell for the first project$/ do |content|
  page.find("table td:first").should have_selector(".assignment[title='#{content}']")
end

Then /^I should see "([^"]*)" in the second project for the second week$/ do |content|
  page.all("table tr.project").second.all("td").second
    .should have_selector(".assignment[title='#{content}']")
end

Then /^I should not see the assignment$/ do
  id = @assignment.id
  page.should_not have_selector(".assignment[data-id='#{id}'] a.delete")
end

Then /^I should see "([^"]*)" on the bench for each week$/ do |contractor_name|
  page.all('tr.bench td').each do |el|
    el.should have_content(contractor_name)
  end
end
