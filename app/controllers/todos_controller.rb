class TodosController < ApplicationController
    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        @todo.save
        redirect_to @todo
    end

    def show
    end

    private

    def todo_params
        params.require(:todo).permit(:description)
    end
end