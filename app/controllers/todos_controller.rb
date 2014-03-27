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

    def show    # def destroy in order to use window.controller (that leads to the GET/show view)
                # and checkbox function in index view (the list)
        @todo = Todo.find(params[:id])

        # if @todo.destroy
        #   redirect_to todos_path, notice: "Todo is complete!"
        # else
        #   flash[:error] = "There was an error."
        #   render :index
        # end
    end

    def index
        @todos = current_user.todos
        authorize @todos
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