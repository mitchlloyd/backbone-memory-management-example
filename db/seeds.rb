# See data for projects
[
  {name: 'Out', virtual: true},
  {name: 'Rails'},
  {name: 'IBM Enterprise Thing'},
  {name: 'Next Version of iOS'},
  {name: 'Cold Fusion'},
  {name: 'Olympic Website'},
  {name: 'Mars Rover AI'}
].each do |project_data|
  unless Project.find_by_name(project_data[:email])
    Project.create!(
      name: project_data[:name],
      display: true,
    )
  end
end


# Seed data for contractors
[
   {name: 'Mitch Lloyd', email: 'mitch.lloyd@gmail.com'},
   {name: 'David Hanson', email: 'david@loudthinking.com'},
   {name: 'Yehuda Katz', email: 'wycats@gmail.com'},
   {name: 'Jeremy Ashkenas', email: 'jashkenas@gmail.com'},
   {name: 'James Halliday', email: 'mail@substack.net'},
   {name: 'Ryan Dahl', email: 'ry@tinyclouds.org'},
   {name: 'Alex MacCaw', email: 'info@eribium.org'},
   {name: 'John Resign', email: 'jeresig@gmail.com'},
   {name: 'Bret Victor', email: 'bret@worrydream.com'}
].each do |contractor_data|
  unless Contractor.find_by_email(contractor_data[:email])
    Contractor.create!(
      name: contractor_data[:name],
      email: contractor_data[:email],
      display: true
    )
  end
end
