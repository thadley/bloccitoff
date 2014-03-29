require 'spec_helper'

feature 'Project manager creates TODO' do
    scenario 'Successfully' do
        visit new_todo_path
        fill_in 'Description', with: 'Meet up with the team'
        click_button 'Save'
        expect( page ).to have_content('Your new TODO was saved')
        expect( page ).to have_content('Meet up with the team')
    end
end

# Scenario: Successfully creating a TODO

#   PM goes to the TODO creation page
#   PM submits new TODO description
#   PM sees confirmation message
#   PM sees newly saved TODO

# User story

# As a Project Manager
# In order to keep track of a project's tasks
# I want to create TODOs
# --> Project manager creates a TODO