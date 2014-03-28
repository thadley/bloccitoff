class TodosController < ApplicationController

    def new
        @todo = Todo.new
        authorize @todo
    end

    def create
        @todo = current_user.todos.build(todo_params)
        authorize @todo
        if @todo.save
          redirect_to todos_path, notice: 'Your new todo was saved'
        else
          flash[:error] = "There was an error saving your todo"
          render :new
        end
    end

    def show    
        @todo = Todo.find(params[:id])
    end

    def index
        if current_user
            @todos = current_user.todos
            authorize @todos
        else
            raise Pundit::NotAuthorizedError, "You must be logged in to view todos."
        end
    end

    def destroy
        @todo = Todo.find(params[:id])

        if @todo.destroy
          render :text => "OK"
        else
          flash[:error] = "There was an error."
          render :index
        end

        # respond_with(@todo) do |f|
        #     f.html { redirect_to todos_path}
        # end
    end

    private

    def todo_params
        params.require(:todo).permit(:description, :time_left)
    end
end