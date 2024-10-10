User.destroy_all
Project.destroy_all

User.create!(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

projects = [
  { name: 'Project 1', description: 'First project', status: 'In Progress' },
  { name: 'Project 2', description: 'Second project', status: 'Todo' },
  { name: 'Project conversation history', description: 'Project conversation history technical assessment', status: 'Done' }
]

projects.each do |project|
  Project.create!(project)
end

puts "Seeded #{User.count} user and #{Project.count} projects."
