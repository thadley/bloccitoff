require 'spec_helper'

feature 'Creates TODO with description missing' do
    scenario 'Successfully' do
        visit new_todo_path
        fill_in 'Description', with: ''
        click_button 'Save'
        expect( page ).to have_content('There was an error saving your TODO')
    end
end

# Goes to the TODO creation page
# Submits a new TODO without description
# Sees an error message