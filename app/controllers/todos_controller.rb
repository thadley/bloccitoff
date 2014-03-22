class TodosController < ApplicationController
    def new
        @todo = Todo.new
        authorize @todo
    end

    def create
        @todo = current_user.todos.build(todo_params)
        authorize @todo
        if @todo.save
          redirect_to todos_path, notice: 'Your new TODO was saved'
        else
          flash[:error] = "There was an error saving your TODO"
          render :new
        end
    end

    def show
        @todo = Todo.find params[:id]
        authorize @todo
    end

    def index
        @todos = current_user.todos
        authorize @todos
    end

    # def destroy
    #     @todo = Todo.find(params[:id])
    #     authorize @todo
    #     if @todo.destroy
    #       flash[:notice] = "Todo is complete!"
    #       redirect_to todos_path
    #     else
    #       flash[:error] = "There was an error."
    #       render :show
    #     end
    # end

    private

    def todo_params
        params.require(:todo).permit(:description, :time_left)
    end
end