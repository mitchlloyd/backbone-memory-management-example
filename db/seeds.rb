# Create a project that can be used to assign contractors
# who are "out" on vacation or for another reason.
unless Project.find_by_name('Out')
  Project.create(name: 'Out', display: true, virtual: true)
end
