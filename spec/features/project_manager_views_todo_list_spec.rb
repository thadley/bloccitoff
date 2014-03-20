require 'spec_helper'

feature 'Views TODO list' do
    scenario 'Successfully' do
       visit todos_path
       expect( page ).to have_content('My List')
    end
end

# Goes to the todo list
# Views all todos on 'My List'