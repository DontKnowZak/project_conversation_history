project = Project.create(name: 'Project conversation history', description: 'Project conversation history technical assessment', status: 'Todo')

user = User.create!(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

zak = User.create!(
  email: 'zak@example.com',
  password: 'password',
  password_confirmation: 'password'
)

questions_todo = [
  'Hi, I just wanted to get some more information about this project before I get started, here are some questions I have:',
  'What is the purpose of this project?',
  'Does the user need to be authenticated to view the project and/or leave comments?',
  'What is the expected behavior when a user leaves a comment?',
  'What is the expected behavior when a user changes the status of a project?',
  'Is there any additional functionality that should be implemented, deleting or editing comments? Creating or deleting projects?',
  'If there is additional functionality, do I need admin roles for any of these functions',
  'What are the available statuses for a project?',
  'Are the restrictions on comments, such as length or content?',
  'How should the comments and status changes be displayed on the project show page? Reverse chronological order?',
  'Should the project show page display the user who made the comment or status change?',
  'What information should be displayed about the user?',
  'What information should be displayed about a project?',
  'Should the project show page display the date and time of the comment or status change?',
  'What frameworks and libraries should I be using for this project aside from Ruby on Rails?'
]


Comment.create!(content: questions_todo.join("\n"), user: zak, project: project)


answers_todo = [
  'The purpose of this project is to allow users to see the history of comments and status changes of a project, and to be able to leave their own comments on a project and change the status of the project.',
  'The user does need to be authenticated to view the project and leave comments.',
  'When a user leaves a comment, the comment should be saved to the database and displayed on the project show page.',
  'When a user changes the status of a project, a status change should be saved to the database, the project status should be updated and the updated information displayed on the project show page.',
  'Editing and deleting comments would be a good feature to implement in the future. Creating and deleting projects is not in the scope of this project.',
  'Admin roles are not needed for this project.',
  'The available statuses for a project are "Todo", "In Progress", and "Done".',
  'There are no restrictions on comments.',
  'The comments and status changes should be displayed on the project show page in reverse chronological order.',
  'The project show page should have the: project name, description, status, and the comments and status changes. Both of which should have the date and time and the user who made the comment or status change, identifying by the user\'s email address.',
  'Probably best to use similar tools as our other projects. <LINK TO TECH STACK WOULD GO HERE IF I WERE UNFAMILIAR>'
]

Comment.create!(content: answers_todo.join("\n"), user: user, project: project)

project.update!(status: 'In Progress')
StatusChange.create!(status: 'In Progress', user: zak, project: project)

questions_in_progress = [
  'Hi there, I have a few more questions now that I have started working on the project:',
  'Should the comments and status changes be combined into a single list so they make sense in context next to each other?',
  'Do you have any styling requirements for the application?',
  'Should I utilise viewcomponents for the project show page?'
]

Comment.create!(content: questions_in_progress.join("\n"), user: zak, project: project)

questions_in_progress = [
  'Combining the comments and status changes into a single list would be a good idea.',
  'None aside from using tailwindcss like our other projects, use your best judgement.',
  'Yes, viewcomponents should be used in this project.'
]

Comment.create!(content: questions_in_progress.join("\n"), user: user, project: project)

project.update!(status: 'Done')
StatusChange.create!(status: 'Done', user: zak, project: project)
