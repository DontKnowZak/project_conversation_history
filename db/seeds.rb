Project.destroy_all
User.destroy_all

load 'db/seeds/project_conversation_history.rb'

puts "Seeded #{User.count} user and #{Project.count} projects."
