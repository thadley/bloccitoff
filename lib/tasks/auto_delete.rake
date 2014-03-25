desc "Automatically deletes todo after 7 days"
task delete_todos: :environment do
  Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
end

# works "automatically" with whenever gem (schedule.rb)
# :environment is a dependency (will be run first) that loads the 
# environment to have access to models, classes, etc.
# http://railscasts.com/episodes/66-custom-rake-tasks